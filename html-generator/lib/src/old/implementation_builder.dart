import 'package:code_builder/code_builder.dart';
import 'package:rampage_html_generator/src/references.dart';
import 'package:recase/recase.dart';
import 'package:web_idl/web_idl.dart';

const Reference jsEnumReference = Reference('String');

class ImplementationBuilder implements ElementVisitor<Spec> {
  final WebIdlTypeConversions _converter = WebIdlTypeConversions();

  @override
  Spec visitFragment(FragmentElement element) {
    throw UnimplementedError();
  }

  @override
  Spec visitTypeAlias(TypeAliasElement element) {
    throw UnimplementedError();
  }

  @override
  Spec visitEnum(EnumElement element) {
    final library = LibraryBuilder();
    final name = element.name;
    final jsEnumName = jsEnumReference.symbol!;

    // Build a constant JsEnum for each value
    final codeBlock = BlockBuilder();
    for (final value in element.values) {
      codeBlock.addExpression(
        literalString(value)
            .assignConst(_jsEnumValueName(value), jsEnumReference),
      );
    }

    // Create the extension from the Dart enum to the JS enum
    final toJsEnum = ExtensionBuilder()
      ..name = '$name$jsEnumName'
      ..on = refer(name)
      ..docs.add('/// Conversions from [$name]s to [$jsEnumName]s.');

    // Generate the getter body
    final toJsEnumBody = StringBuffer('switch (this) {');
    for (final value in element.values) {
      toJsEnumBody.write(
        'case $name.${_jsEnumValue(value)}:'
        '  return ${_jsEnumValueName(value)};',
      );
    }
    toJsEnumBody.write('}');

    // Create the getter
    toJsEnum.methods.add(
      Method(
        (b) => b
          ..name = 'jsEnum'
          ..type = MethodType.getter
          ..returns = jsEnumReference
          ..lambda = false
          ..body = Code(toJsEnumBody.toString())
          ..docs.add('/// Converts a [$name] to a [$jsEnumName].'),
      ),
    );

    // Create the extension from the JS enum to the Dart enum
    final toDartEnum = ExtensionBuilder()
      ..name = '$jsEnumName$name'
      ..on = refer(name)
      ..docs.add('/// Conversions from [$jsEnumName]s to [$name]s.');

    // Generate the getter body
    final toDartEnumBody = StringBuffer('switch (this) {');
    for (final value in element.values) {
      toDartEnumBody.write(
        'case ${_jsEnumValueName(value)}:'
        '  return $name.${_jsEnumValue(value)};',
      );
    }
    toDartEnumBody.write(
      '}'
      "throw ArgumentError.value(this, 'is not a $name');",
    );

    // Create the getter
    toDartEnum.methods.add(
      Method(
        (b) => b
          ..name = name.camelCase
          ..type = MethodType.getter
          ..returns = refer(name)
          ..lambda = false
          ..body = Code(toDartEnumBody.toString())
          ..docs.add('/// Converts a [JsEnum] to a [$name].'),
      ),
    );

    // Add everything to the library
    library.body.addAll([
      codeBlock.build(),
      toJsEnum.build(),
      toDartEnum.build(),
    ]);

    return library.build();
  }

  String _jsEnumValue(String value) =>
      value.isNotEmpty ? value.camelCase : 'none';
  String _jsEnumValueName(String value) => '_${_jsEnumValue(value)}';

  @override
  Spec visitArgument(ArgumentElement element) {
    // TODO: implement visitArgument
    throw UnimplementedError();
  }

  @override
  Spec visitAttribute(AttributeElement element) {
    // TODO: implement visitAttribute
    throw UnimplementedError();
  }

  @override
  Spec visitConstant(ConstantElement element) {
    // TODO: implement visitConstant
    throw UnimplementedError();
  }

  @override
  Spec visitConstructor(OperationElement element) {
    // TODO: implement visitConstructor
    throw UnimplementedError();
  }

  @override
  Spec visitDictionary(DictionaryElement element) {
    // TODO: implement visitDictionary
    throw UnimplementedError();
  }

  @override
  Spec visitDictionaryMember(DictionaryMemberElement element) {
    // TODO: implement visitDictionaryMember
    throw UnimplementedError();
  }

  @override
  Spec visitFunctionTypeAlias(FunctionTypeAliasElement element) {
    const functionLocalName = 'callback';
    const functionReturnType = 'void';

    final jsFunctionParameters = StringBuffer();
    final dartFunctionArguments = StringBuffer();
    final directives = <Directive>[];

    for (final argument in element.arguments) {
      final name = argument.name;
      final type = argument.type as SingleType;
      final jsType = jsObjectReference;

      jsFunctionParameters.write('${jsType.symbol} $name,');
      dartFunctionArguments.write('$name,');

      directives.add(
        Directive(
          (b) => b
            ..type = DirectiveType.import
            ..url = '${type.name.snakeCase}.dart',
        ),
      );
    }

    final code = Block(
      (b) => b
        ..statements.addAll(<Code>[
          Code(
            '$functionReturnType $functionLocalName($jsFunctionParameters) '
            '{ this($dartFunctionArguments); }',
          ),
          jsFunctionReference
              .property('withThis')
              .call(<Expression>[refer(functionLocalName)])
              .returned
              .statement,
        ]),
    );

    final jsFunctionName = jsFunctionReference.symbol!;
    final method = Method(
      (b) => b
        ..name = jsFunctionName.camelCase
        ..type = MethodType.getter
        ..returns = jsFunctionReference
        ..body = code,
    );

    final name = element.name;
    final toJsFunction = Extension(
      (b) => b
        ..name = '$name$jsFunctionName'
        ..on = refer(name)
        ..docs.add('/// Converts a [$name]s to a [$jsFunctionName].')
        ..methods.add(method),
    );

    return Library((b) => b..body.add(toJsFunction));
  }

  @override
  Spec visitIncludesStatement(IncludesElement element) {
    // TODO: implement visitIncludesStatement
    throw UnimplementedError();
  }

  @override
  Spec visitInterface(InterfaceElement element) {
    // TODO: implement visitInterface
    throw UnimplementedError();
  }

  @override
  Spec visitNamespace(NamespaceElement element) {
    // TODO: implement visitNamespace
    throw UnimplementedError();
  }

  @override
  Spec visitOperation(OperationElement element) {
    // TODO: implement visitOperation
    throw UnimplementedError();
  }
}
