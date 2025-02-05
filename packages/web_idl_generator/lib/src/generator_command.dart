import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:meta/meta.dart';
import 'package:web_idl/web_idl.dart';

import 'source_generator.dart';

abstract class GeneratorCommand extends Command<void> {
  @protected
  GeneratorCommand(this._generator) : super();

  final SourceGenerator _generator;

  static final DartFormatter _formatter = DartFormatter(
    languageVersion: DartFormatter.latestLanguageVersion,
  );

  @override
  Future<void> run() async {
    final contents = await File('bin/dom.idl').readAsString();
    final idl = parseFragment(contents);
    final library = _generator.library(idl);

    // A DartEmitter can't be reused otherwise it'll import everything
    final emitter = DartEmitter(
      allocator: Allocator(),
      orderDirectives: true,
      useNullSafetySyntax: true,
    );

    final source = _formatter.format(library.accept(emitter).toString());
    print(source);
  }
}
