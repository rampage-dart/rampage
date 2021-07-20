import 'package:code_builder/code_builder.dart';
import 'package:recase/recase.dart';
import 'package:web_idl/web_idl.dart';

import 'code_builder.dart';
import 'references.dart';

class ImplementationBuilder extends CodeBuilder {
  ///
  ImplementationBuilder() : super(ImplementationTypeConversions());

  //------------------------------------------------------------------
  // InterfaceElement
  //------------------------------------------------------------------

  @override
  Library visitInterface(InterfaceElement element) {
    if (element.isCallback) {
      return _callbackInterface(element);
    }

    assert(!element.isPartial, 'interface should not be partially defined');

    return Library(
      (l) => l
        ..directives.addAll(_interfaceDirectives(element))
        ..body.addAll(<Spec>[
          if (element.isMixin) _mixin(element) else _interface(element),
          ..._interfaceFunctions(element)
        ]),
    );
  }

  Library _callbackInterface(InterfaceElement element) {
    assert(
      element.operations.length == 1,
      'a callback interface should only have a single operation',
    );

    final function = element.operations[0];
    return Library((l) => l);
  }

  Iterable<Directive> _interfaceDirectives(InterfaceElement element) sync* {
    yield Directive.import('package:rampage_html/html.dart', as: 'inter');
    yield Directive.import('package:rampage_html/js/html.dart', as: 'js');
  }

  Class _interface(InterfaceElement element) {
    final name = converter.dartType(element.thisType);

    final supertype = element.supertype;
    late final Reference extend;

    if (supertype != null) {
      final supertypeName = converter.dartType(supertype);
      extend = TypeReference((t) => t
        ..symbol = supertypeName
        ..url = '${supertypeName.snakeCase}.dart'
        ..types.add(const Reference('T')));
    } else {
      extend = TypeReference((t) => t
        ..symbol = 'DartJsWrapper'
        ..url = 'wrapper.dart'
        ..types.add(const Reference('T')));
    }

    return Class(
      (c) => c
        ..name = name
        ..types.addAll(_interfaceTypes(element))
        ..extend = extend
        ..implements.addAll(_interfaceImplements(element))
        ..constructors.addAll(_interfaceConstructors(element))
        ..methods.addAll(_interfaceMethods(element)),
    );
  }

  Mixin _mixin(InterfaceElement element) {
    final name = converter.dartType(element.thisType);

    return Mixin(
      (c) => c
        ..name = name
        ..on = TypeReference(
          (t) => t
            ..symbol = 'JsWrapper'
            ..types.add(
              refer('js.$name'),
            )
            ..url = 'wrapper.dart',
        )
        ..implements.addAll(_interfaceImplements(element))
        ..methods.addAll(_interfaceMethods(element)),
    );
  }

  Iterable<Reference> _interfaceTypes(InterfaceElement element) sync* {
    // Should really only do this when there's no descendants
    final name = converter.dartType(element.thisType);

    yield TypeReference(
      (t) => t
        ..symbol = 'T'
        ..bound = Reference('js.$name'),
    );
  }

  /// Implements clause for the JS interface.
  Iterable<Reference> _interfaceImplements(InterfaceElement element) sync* {
    final name = converter.dartType(element.thisType);
    yield Reference('inter.$name');
  }

  /// Constructors for the JS interface.
  Iterable<Constructor> _interfaceConstructors(
    InterfaceElement element,
  ) sync* {
    if (element.constructors.isNotEmpty) {}

    // Add .fromJsObject constructor
    yield Constructor(
      (c) => c
        ..name = 'fromJsObject'
        ..requiredParameters.add(Parameter(
          (p) => p
            ..name = 'jsObject'
            ..type = refer('T'),
        ))
        ..initializers.add(
          refer('super')
              .property('fromJsObject')
              .call(<Expression>[refer('jsObject')]).code,
        ),
    );
  }

  /// Methods for the JS interface.
  Iterable<Method> _interfaceMethods(InterfaceElement element) sync* {
    yield* element.allAttributes.expand(_attributeMethod);
    //yield* element.allOperations.expand(_operationMethod);
  }

  Iterable<Method> _interfaceFunctions(InterfaceElement element) sync* {
    if (!element.isMixin) {
      yield _interfaceConstructorTearOff(element);
      yield _interfaceSafeFromJs(element);
      yield _interfaceSafeFromJsNullable(element);
    }
  }

  Method _interfaceConstructorTearOff(InterfaceElement element) {
    final type = converter.dartType(element.thisType);
    const jsType = Reference('js.DartWrapper');

    return Method((m) => m
          ..name = '_constructor'
          ..returns = refer(type)
          ..lambda = true
          ..requiredParameters.add(Parameter((p) => p
            ..name = 'jsObject'
            ..type = jsType))
          ..body = refer(type)
              .property('fromJsObject')
              .call(<Expression>[refer('jsObject').asA(refer('js.$type'))]).code
        //..body = Reference('safeDartObjectFromJs').call(<Expression>[refer('jsObject', refer('_constructor'))]),
        );
  }

  Method _interfaceSafeFromJs(InterfaceElement element) {
    final type = converter.dartType(element.thisType);

    return Method(
      (m) => m
        ..name = 'safe${type}FromJs'
        ..lambda = true
        ..returns = refer(type)
        ..requiredParameters.add(Parameter(
          (p) => p
            ..name = 'jsObject'
            ..type = refer('js.$type'),
        ))
        ..body = refer('safeDartObjectFromJs', 'wrapper.dart')
            .call(
              <Expression>[refer('jsObject'), refer('_constructor')],
              {},
              <Reference>[refer('js.$type')],
            )
            .asA(refer(type))
            .code,
    );
  }

  Method _interfaceSafeFromJsNullable(InterfaceElement element) {
    final type = converter.dartType(element.thisType);

    return Method(
      (m) => m
        ..name = 'safe${type}FromJsNullable'
        ..lambda = true
        ..returns = refer('$type?')
        ..requiredParameters.add(Parameter(
          (p) => p
            ..name = 'jsObject'
            ..type = refer('js.$type?'),
        ))
        ..body = refer('safeDartObjectFromJsNullable', 'wrapper.dart')
            .call(
              <Expression>[refer('jsObject'), refer('_constructor')],
              {},
              <Reference>[refer('js.$type')],
            )
            .asA(refer('$type?'))
            .code,
    );
  }

  @override
  visitEnum(EnumElement element) {
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
      ..on = jsEnumReference
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

  static const Reference jsEnumReference = Reference('String');
  String _jsEnumValue(String value) =>
      value.isNotEmpty ? value.camelCase : 'none';
  String _jsEnumValueName(String value) => '_${_jsEnumValue(value)}';

  //------------------------------------------------------------------
  // Common
  //------------------------------------------------------------------

  Iterable<Method> _attributeMethod(AttributeElement element) sync* {
    final name = element.name;
    final type = element.type as SingleType;
    final typeRef = converter.dartTypeRef(element.type as SingleType);

    late final Expression getterBody;
    print('Looking at ${type.name}');
    if (type.name == 'DOMHighResTimeStamp' || type.isBuiltIn) {
      getterBody = const Reference('jsObject').property(name);
    } else if (type.isInterface) {
      getterBody =
          _dartWrapperFromJs(const Reference('jsObject').property(name), type);
    } else if (type.isEnum) {
      getterBody =
          Reference('jsObject', typeRef.url).property(name).property('jsEnum');
    } else {
      throw UnsupportedError('shiiiit');
    }

    yield Method(
      (m) => m
        ..name = name
        ..annotations.add(_overrideReference())
        ..type = MethodType.getter
        ..returns = typeRef
        ..lambda = true
        ..body = getterBody.code,
    );

    if (element.readWrite) {
      late final Expression setterBody;
      if (type.isBuiltIn) {
        setterBody =
            const Reference('jsObject').property(name).assign(refer('value'));
      } else if (type.isInterface) {
        setterBody = const Reference('jsObject')
            .property(name)
            .assign(refer('value').property('jsObject'));
      } else {
        throw UnsupportedError('shiiiiiiit');
      }

      yield Method(
        (m) => m
          ..name = name
          ..annotations.add(_overrideReference())
          ..type = MethodType.setter
          ..requiredParameters.add(Parameter(
            (p) => p
              ..name = 'value'
              ..type = typeRef,
          ))
          ..body = setterBody.statement,
      );
    }
  }

  //------------------------------------------------------------------
  // Utilities
  //------------------------------------------------------------------

  Expression _dartWrapperFromJs(Expression source, SingleType type) {
    final name = converter.dartType(type);

    return Reference(
      'safe${name}FromJs${type.isNullable ? 'Nullable' : ''}',
      '${name.snakeCase}.dart',
    ).call(<Expression>[source]);
  }

  Expression _dartWrapperToJs(Expression source, SingleType type) =>
      source.property('jsObject');

  Expression _dartEnumFromJs(Expression source, SingleType type) {
    return source;
  }

  Expression _dartEnumToJs(Expression source, SingleType type) {
    return source;
  }

  static Reference _overrideReference() => const Reference('override');
}

class ImplementationTypeConversions extends WebIdlTypeConversions {
  ///
  ImplementationTypeConversions()
      : super(renameTo: {
          'Attr': 'Attribute',
          'CDATASection': 'CDataSection',
          'DOMImplementation': 'DomImplementation',
          'DOMTokenList': 'DomTokenList',
          'HTMLCollection': 'HtmlCollection',
          'XMLDocument': 'XmlDocument',

          // DOM Shit
          'HTMLBodyElement': 'BodyElement',
          'HTMLHeadElement': 'HeadElement',
          'HTMLElement': 'HtmlElement',
          'HTMLSlotElement': 'SlotElement',
          'HTMLTemplateElement': 'TemplateElement',
        });
}
