import 'dart:io';
import 'dart:convert';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as p;
import 'package:web_idl/web_idl.dart';

import 'source_generator.dart';
import 'type_converter.dart';

/// Options for the command.
typedef _Options = ({List<String> inputs, String output, String extension});

/// A [File] with its parsed [FragmentElement].
typedef _FileFragment = ({File file, FragmentElement fragment});

const _outputOption = 'output';
const _extensionOption = 'extension';

extension on ArgResults {
  String? get output => option(_outputOption);
  String get extension => option(_extensionOption) ?? '.dart';
}

extension on FragmentElement {
  Iterable<Element> get allDefinitions sync* {
    yield* dictionaries.where(_isConcrete);
    yield* enumerations;
    yield* interfaces.where(_isConcrete);
    yield* typeDefinitions;
  }

  static bool _isConcrete(PartiallyDefinedElement e) => !e.isPartial;
}

abstract class GeneratorCommand extends Command<void> {
  @protected
  GeneratorCommand(this._generator) {
    argParser
      ..addOption('output', abbr: 'o')
      ..addOption('extension', abbr: 'e');
  }

  final SourceGenerator _generator;

  static final DartFormatter _formatter = DartFormatter(
    languageVersion: DartFormatter.latestLanguageVersion,
  );

  @override
  Future<void> run() async {
    final options = await _getOptions();
    final fragments = <_FileFragment>[];

    for (final path in options.inputs) {
      /*
      final joined = StringBuffer();
      final fileContents = await _readFiles(path).toList();
      for (final record in fileContents) {
        joined.write(record.contents);
      }
      fragments.add((
        file: fileContents[0].file,
        fragment: parseFragment(joined.toString()),
      ));
      */

      final pathFragments = await _readIdlFiles(path).toList();
      fragments.addAll(pathFragments);
    }

    final outputToFile = options.output.isNotEmpty;
    final fragmentMappings =
        fragments.map((r) {
          final path = p.setExtension(
            p.basename(r.file.path),
            options.extension,
          );

          return TypeMap.fromEntries(
            r.fragment.allDefinitions.map(
              (e) => TypeMapEntry(e.name, (e.name, path)),
            ),
          );
        }).toList();

    for (var i = 0; i < fragments.length; ++i) {
      final record = fragments[i];
      print('Generating from ${record.file.path}');

      final fragmentMapping = fragmentMappings[i];
      final mapping = TypeMap.fromEntries(
        fragmentMappings
            .where((e) => !identical(e, fragmentMapping))
            .expand((e) => e.entries),
      );

      // A DartEmitter can't be reused otherwise it'll import everything
      final emitter = DartEmitter(
        allocator: Allocator(),
        orderDirectives: true,
        useNullSafetySyntax: true,
      );
      final library = _generator.library(record.fragment, mapping: mapping);
      final built = library.accept(emitter).toString();
      //print(built);
      final source = _formatter.format(built);

      if (outputToFile) {
        await File(
          p.join(
            options.output,
            p.setExtension(p.basename(record.file.path), options.extension),
          ),
        ).writeAsString(source);
      } else {
        print(source);
      }
    }
  }

  Future<_Options> _getOptions() async {
    final inputs = argResults!.rest;
    if (inputs.isEmpty) {
      throw UsageException(
        'no input files/directories specified',
        'provide locations to process',
      );
    }

    var output = argResults!.output;
    if (output != null) {
      final exists = await Directory(output).exists();
      if (!exists) {
        throw UsageException('output directory does not exist', '');
      }
    } else {
      output = '';
    }

    return (inputs: inputs, output: output, extension: argResults!.extension);
  }

  static Stream<_FileFragment> _readIdlFiles(String path) => _readFiles(
    path,
  ).map((r) => (file: r.file, fragment: parseFragment(r.contents)));

  static Stream<({File file, String contents})> _readFiles(String path) async* {
    final type = await FileSystemEntity.type(path);

    if (type == FileSystemEntityType.directory) {
      final directory = Directory(path);
      yield* directory
          .list()
          .where((e) => e is File && e.path.endsWith('.idl'))
          .cast<File>()
          .asyncMap(_readFile);
    } else if (type == FileSystemEntityType.file) {
      final record = await _readFile(File(path));
      yield record;
    }
  }

  static Future<({File file, String contents})> _readFile(File file) async {
    final contents = await file.readAsString();
    return (file: file, contents: contents);
  }
}
