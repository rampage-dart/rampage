import 'dart:io';

import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:recase/recase.dart';
import 'package:web_idl/web_idl.dart';

import 'code_builder.dart';

class CodeWriter {
  CodeWriter(this.builder, this.packageRoot, this.header);

  final String packageRoot;
  final CodeBuilder builder;
  final DartFormatter formatter = DartFormatter();

  final String header;

  final Map<String, List<String>> _exports = <String, List<String>>{};

  Future<void> writeFragment(FragmentElement element) async {
    final elements = <Element>[
      ...element.interfaces.where((e) => !e.isPartial),
      ...element.dictionaries.where((e) => !e.isPartial),
      ...element.namespaces.where((e) => !e.isPartial),
      ...element.enumerations,
      ...element.typeDefinitions,
      ...element.functions,
    ];

    _exports['html'] = <String>[];

    for (final element in elements) {
      await _writeElement(element);
    }

    //await _writeExports('html', _exports['html']!);

    //return Future.wait(elements.map(_writeElement));
  }

  Future<void> _writeElement(Element element) async {
    late final Library library;

    // Ugh this'd be easier if visitors worked
    if (element is InterfaceElement) {
      library = builder.visitInterface(element);
    } else if (element is DictionaryElement) {
      library = builder.visitDictionary(element);
    } else if (element is NamespaceElement) {
      library = builder.visitNamespace(element as NamespaceElement);
    } else if (element is FunctionTypeAliasElement) {
      library = builder.visitFunctionTypeAlias(element);
    } else if (element is EnumElement) {
      library = builder.visitEnum(element);
    } else {
      library = builder.visitTypeAlias(element as TypeAliasElement);
    }

    if (library.body.isNotEmpty) {
      // A DartEmitter can't be reused otherwise it'll import everything
      final emitter = DartEmitter(
        allocator: Allocator(),
        orderDirectives: true,
        useNullSafetySyntax: true,
      );

      final source = formatter.format(library.accept(emitter).toString());

      if (source.isNotEmpty) {
        final name = builder.converter
            .dartType((element as TypeDefiningElement).thisType);

        final relativePath = 'src/${name.snakeCase}.dart';
        final file = File('$packageRoot/$relativePath');

        await file.writeAsString(header);
        await file.writeAsString(source, mode: FileMode.append);

        _exports['html']!.add(relativePath);
      }
    }
  }

  Future<void> _writeExports(String name, List<String> exports) async {
    final library = Library(
      (l) => l
        ..directives.addAll(exports.map(
          (e) => Directive.export(e),
        )),
    );

    final emitter = DartEmitter(
      allocator: Allocator(),
      orderDirectives: true,
      useNullSafetySyntax: true,
    );

    final source = formatter.format(library.accept(emitter).toString());

    final file = File('$packageRoot/$name.dart');

    await file.writeAsString(header);
    await file.writeAsString(source, mode: FileMode.append);
  }
}
