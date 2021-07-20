import 'package:code_builder/code_builder.dart';
import 'package:recase/recase.dart';
import 'package:web_idl/web_idl.dart';

import 'code_builder.dart';
import 'references.dart';

class InterfaceBuilder extends CodeBuilder {
  ///
  InterfaceBuilder() : super(InterfaceTypeConversions());

  //------------------------------------------------------------------
  // InterfaceElement
  //------------------------------------------------------------------

  @override
  Library visitInterface(InterfaceElement element) {
    if (element.isCallback) {
      return _callbackInterface(element);
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
              ..implements.addAll(_interfaceImplements(element))
              ..constructors.addAll(_interfaceConstructors(element))
              ..methods.addAll(_interfaceMethods(element)),
          ),
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

  /// Implements clause for the JS interface.
  Iterable<Reference> _interfaceImplements(InterfaceElement element) sync* {
    if (!element.isMixin) {}
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
  // NamespaceElement
  //------------------------------------------------------------------

  @override
  Library visitNamespace(NamespaceElement element) => _emptyLibrary();

  //------------------------------------------------------------------
  // EnumElement
  //------------------------------------------------------------------

  @override
  Library visitEnum(EnumElement element) {
    final name = converter.dartType(element.thisType);

    return Library(
      (l) => l
        ..body.add(Enum(
          (e) => e
            ..name = name
            ..values.addAll(_enumValues(element)),
        )),
    );
  }

  Iterable<EnumValue> _enumValues(EnumElement element) =>
      element.values.map(_enumValue);

  EnumValue _enumValue(String value) => EnumValue(
        (v) => v..name = value.camelCase,
      );

  //------------------------------------------------------------------
  // FunctionTypeAliasElement
  //------------------------------------------------------------------

  @override
  Library visitFunctionTypeAlias(FunctionTypeAliasElement element) =>
      _emptyLibrary();

  //------------------------------------------------------------------
  // TypeAliasElement
  //------------------------------------------------------------------

  @override
  Library visitTypeAlias(TypeAliasElement element) => _emptyLibrary();

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
        ..returns = type,
    );

    if (element.readWrite) {
      yield Method((m) => m
        ..name = name
        ..type = MethodType.setter
        ..requiredParameters.add(Parameter(
          (p) => p
            ..name = 'value'
            ..type = type,
        )));
    }
  }

  Iterable<Method> _operationMethod(OperationElement element) sync* {
    final name = element.name;

    yield Method(
      (m) => m
        ..name = name
        ..returns = converter.dartTypeRef(element.returnType as SingleType),
    );
  }

  static Library _emptyLibrary() => Library((b) => b);
}

class InterfaceTypeConversions extends WebIdlTypeConversions {
  ///
  InterfaceTypeConversions()
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
