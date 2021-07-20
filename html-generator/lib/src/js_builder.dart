import 'package:code_builder/code_builder.dart';
import 'package:recase/recase.dart';
import 'package:web_idl/web_idl.dart';

import 'code_builder.dart';
import 'references.dart';

/// Builds the `package:js` wrappers around the JavaScript objects.
///
/// For `interface`s
///
/// At the `js-interop` level an `enum` is just a [String] so no code is
/// generated for an [EnumElement].
///
/// At the `js-interop` level a `callback` is just a [Function] so no code is
/// generated for a [FunctionTypeAliasElement].
class JsBuilder extends CodeBuilder {
  /// Create an instance of [JsBuilder].
  JsBuilder() : super(JsTypeConversions());

  //------------------------------------------------------------------
  // InterfaceElement
  //------------------------------------------------------------------

  @override
  Library visitInterface(InterfaceElement element) {
    // A `callback interface` is a legacy version of a `callback` and not an
    // actual interface so return an empty library
    if (element.isCallback) {
      return super.visitInterface(element);
    }

    assert(!element.isPartial, 'interface should not be partially defined');

    final name = converter.dartType(element.thisType);

    return Library(
      (l) => l
        ..body.addAll(<Spec>[
          Class(
            (c) => c
              ..name = name
              ..abstract = true
              ..annotations.addAll(_interfaceAnnotations(element))
              ..implements.addAll(_interfaceImplements(element))
              ..constructors.addAll(_interfaceConstructors(element)),
          ),
          Extension(
            (e) => e
              ..name = '${name}Impl'
              ..on = Reference(name)
              ..methods.addAll(_interfaceMethods(element)),
          ),
        ]),
    );
  }

  /// Annotations for the JS interface.
  Iterable<Expression> _interfaceAnnotations(InterfaceElement element) sync* {
    yield _jsAnnotation(!element.isMixin ? element.name : '');
  }

  /// Implements clause for the JS interface.
  Iterable<Reference> _interfaceImplements(InterfaceElement element) sync* {
    if (!element.isMixin) {
      final supertype = element.supertype;

      yield supertype != null
          ? converter.dartTypeRef(supertype)
          : _dartWrapperReference();

      // \TODO Add implements for all mixin types
    }
  }

  /// Constructors for the JS interface.
  Iterable<Constructor> _interfaceConstructors(
    InterfaceElement element,
  ) sync* {}

  /// Methods for the JS interface.
  Iterable<Method> _interfaceMethods(InterfaceElement element) sync* {
    yield* element.allAttributes.expand(_attributeMethod);
    yield* element.allOperations.expand(_operationMethod);
  }

  //------------------------------------------------------------------
  // DictionaryElement
  //------------------------------------------------------------------

  @override
  Library visitDictionary(DictionaryElement element) {
    final name = converter.dartType(element.thisType);

    final supertype = element.supertype;
    final extend = supertype != null ? converter.dartTypeRef(supertype) : null;

    return Library((l) => l
      ..body.addAll(<Spec>[
        Class(
          (c) => c
            ..name = name
            ..abstract = true
            ..extend = extend
            ..annotations.addAll(_dictionaryAnnotations(element))
            ..constructors.addAll(_dictionaryConstructors(element)),
        ),
      ]));
  }

  /// Annotations for the JS dictionary.
  Iterable<Expression> _dictionaryAnnotations(DictionaryElement element) sync* {
    yield _anonymousAnnotation();
    yield _jsAnnotation();
  }

  /// Constructors for the JS dictionary.
  Iterable<Constructor> _dictionaryConstructors(
      DictionaryElement element) sync* {
    yield Constructor(
      (c) => c
        ..external = true
        ..factory = true
        ..optionalParameters.addAll(_dictionaryNamedArguments(element)),
    );
  }

  Iterable<Parameter> _dictionaryNamedArguments(
    DictionaryElement element,
  ) sync* {
    final supertype = element.supertype;
    if (supertype != null) {
      yield* _dictionaryNamedArguments(supertype.element as DictionaryElement);
    }

    yield* element.allMembers.map(_dictionaryNamedArgument);
  }

  Parameter _dictionaryNamedArgument(DictionaryMemberElement element) =>
      Parameter(
        (p) => p
          ..name = element.name
          ..named = true
          ..required = !element.type.isNullable
          ..type = converter.dartTypeRef(element.type as SingleType),
      );

  //------------------------------------------------------------------
  // NamespaceElement
  //------------------------------------------------------------------

  @override
  Library visitNamespace(NamespaceElement element) {
    // \TODO THIS IS WRONG
    final name = element.name;

    return Library((l) => l
      ..body.addAll(<Spec>[
        Class(
          (c) => c
            ..name = name
            ..abstract = true
            ..annotations.addAll(_namespaceAnnotations(element)),
        ),
        Extension(
          (e) => e
            ..name = '${name}Impl'
            ..on = Reference(name)
            ..methods.addAll(_namespaceMethods(element)),
        ),
        Method(
          (m) => m
            ..name = name.camelCase
            ..annotations.add(_jsAnnotation(element.name))
            ..external = true
            ..type = MethodType.getter
            ..returns = Reference(name),
        )
      ]));
  }

  /// Annotations for the JS namespace.
  Iterable<Expression> _namespaceAnnotations(NamespaceElement element) sync* {
    yield _anonymousAnnotation();
    yield _jsAnnotation();
  }

  /// Methods for the JS namespace.
  Iterable<Method> _namespaceMethods(NamespaceElement element) sync* {
    yield* element.allAttributes.expand(_attributeMethod);
    yield* element.allOperations.expand(_operationMethod);
  }

  //------------------------------------------------------------------
  // Common
  //------------------------------------------------------------------

  Iterable<Method> _attributeMethod(AttributeElement element) sync* {
    final name = element.name;
    final type = converter.dartTypeRef(element.type as SingleType);

    yield Method(
      (m) => m
        ..name = name
        ..type = MethodType.getter
        ..returns = type
        ..lambda = true
        ..body = _packageJsUtilReference('getProperty')
            .call(<Expression>[
              refer('this'),
              literalString(name),
            ])
            .asA(type)
            .code,
    );

    if (element.readWrite) {
      yield Method(
        (m) => m
          ..name = name
          ..type = MethodType.setter
          ..lambda = false
          ..body = _packageJsReference('setProperty').call(<Expression>[
            refer('this'),
            literalString(name),
            refer('value'),
          ]).statement
          ..requiredParameters.add(Parameter(
            (p) => p
              ..name = 'value'
              ..type = type,
          )),
      );
    }
  }

  Iterable<Method> _operationMethod(OperationElement element) sync* {}

  //------------------------------------------------------------------
  // Utilities
  //------------------------------------------------------------------

  static const _packageJsUrl = 'package:js/js.dart';
  static const _packageJsUtilUrl = 'package:js/js_util.dart';

  /// Create a `package:js` `@JS` annotation.
  ///
  /// If the [value] is the empty string then `@JS()` is outputted.
  static Expression _jsAnnotation([String value = '']) {
    final positionalArguments = value.isNotEmpty
        ? <Expression>[literalString(value)]
        : const <Expression>[];

    return _packageJsReference('JS').call(positionalArguments);
  }

  /// Create a `package:js` `@anonymous` annotation.
  static Expression _anonymousAnnotation() =>
      const Reference('anonymous', _packageJsUrl);

  static Reference _packageJsReference(String symbol) =>
      Reference(symbol, _packageJsUrl);

  static Reference _packageJsUtilReference(String symbol) =>
      Reference(symbol, _packageJsUtilUrl);

  static Reference _dartWrapperReference() =>
      const Reference('DartWrapper', 'wrapper.dart');
}

class JsTypeConversions extends WebIdlTypeConversions {
  ///
  JsTypeConversions()
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

  @override
  Reference dartInterfaceTypeRef(SingleType type) =>
      (type.element as InterfaceElement).isCallback
          ? dartFunctionTypeRef(type)
          : super.dartInterfaceTypeRef(type);

  @override
  Reference dartFunctionTypeRef(SingleType type) => const Reference('Function');

  @override
  Reference dartEnumTypeRef(SingleType type) => const Reference('String');
}
