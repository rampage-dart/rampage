import 'package:code_builder/code_builder.dart';
import 'package:recase/recase.dart';
import 'package:web_idl/web_idl.dart';

import '../references.dart';

class InterfaceBuilder implements ElementVisitor<Spec> {
  final WebIdlTypeConversions _converter = WebIdlTypeConversions();

  @override
  Library visitFragment(FragmentElement element) {
    throw UnimplementedError();
  }

  @override
  Library visitTypeAlias(TypeAliasElement element) {
    throw UnimplementedError();
  }

  @override
  Library visitEnum(EnumElement element) {
    final library = LibraryBuilder();
    final builder = EnumBuilder()..name = element.name;

    for (final value in element.values) {
      builder.values.add(EnumValue((b) => b..name = value.camelCase));
    }

    library.body.add(builder.build());
    return library.build();
  }

  @override
  Library visitArgument(ArgumentElement element) {
    // TODO: implement visitArgument
    throw UnimplementedError();
  }

  @override
  Library visitAttribute(AttributeElement element) {
    // TODO: implement visitAttribute
    throw UnimplementedError();
  }

  @override
  Library visitConstant(ConstantElement element) {
    // TODO: implement visitConstant
    throw UnimplementedError();
  }

  @override
  Library visitConstructor(OperationElement element) {
    // TODO: implement visitConstructor
    throw UnimplementedError();
  }

  @override
  Library visitDictionary(DictionaryElement element) {
    // TODO: implement visitDictionary
    throw UnimplementedError();
  }

  @override
  Library visitDictionaryMember(DictionaryMemberElement element) {
    // TODO: implement visitDictionaryMember
    throw UnimplementedError();
  }

  @override
  Library visitFunctionTypeAlias(FunctionTypeAliasElement element) {
    // TODO: implement visitFunctionTypeAlias
    throw UnimplementedError();
  }

  @override
  Library visitIncludesStatement(IncludesElement element) {
    // TODO: implement visitIncludesStatement
    throw UnimplementedError();
  }

  @override
  Library visitInterface(InterfaceElement element) {
    final library = LibraryBuilder();

    final name = element.name;
    final builder = ClassBuilder()
      ..name = name
      ..abstract = true;

    final supertype = element.supertype;
    if (supertype != null) {
      builder.extend = Reference(supertype.name);
    }

    if (element.allConstructors.isNotEmpty) {
      library.directives.add(Directive(
        (d) => d
          ..type = DirectiveType.import
          ..url = 'package:rampage_html/browser/browser.dart'
          ..as = 'impl',
      ));

      for (final constructor in element.allConstructors) {
        builder.constructors.add(Constructor(
          (c) => c
            ..factory = true
            ..redirect = Reference(
                'impl.$name', 'package:rampage_html/browser/browser.dart')
            ..requiredParameters.addAll(constructor.arguments
                .where(_notDictionaryType)
                .map(_requiredParameter))
            ..optionalParameters.addAll(constructor.arguments
                .where(_dictionaryType)
                .map((a) => (a.type as SingleType).element as DictionaryElement)
                .expand(_expandDictionaryArgument)),
        ));
      }
    }

    for (final attribute in element.allAttributes) {
      final name = attribute.name;
      final type = _converter.dartTypeRef(attribute.type as SingleType);

      builder.methods.add(Method(
        (m) => m
          ..name = name
          ..type = MethodType.getter
          ..returns = type,
      ));

      if (attribute.readWrite) {
        builder.methods.add(Method(
          (m) => m
            ..name = name
            ..type = MethodType.setter
            ..requiredParameters.add(Parameter(
              (p) => p
                ..name = 'value'
                ..type = type,
            )),
        ));
      }
    }

    for (final operation in element.allOperations) {
      final name = operation.name;

      builder.methods.add(Method(
        (m) => m
          ..name = name
          ..static = operation.isStatic
          ..returns = _converter.dartTypeRef(operation.returnType as SingleType)
          ..requiredParameters.addAll(operation.arguments
              .where(_notDictionaryType)
              .map(_requiredParameter))
          ..optionalParameters.addAll(operation.arguments
              .where(_dictionaryType)
              .map((a) => (a.type as SingleType).element as DictionaryElement)
              .expand(_expandDictionaryArgument)),
      ));
    }

    library.body.add(builder.build());
    return library.build();
  }

  bool _dictionaryType(ArgumentElement element) {
    final type = element.type;
    if (type is SingleType) {
      return !type.isBuiltIn && type.isDictionary;
    }

    return false;
  }

  bool _notDictionaryType(ArgumentElement element) => !_dictionaryType(element);

  Parameter _requiredParameter(ArgumentElement argument) => Parameter(
        (p) => p
          ..name = argument.name
          ..type = _converter.dartTypeRef(argument.type as SingleType),
      );

  Iterable<Parameter> _expandDictionaryArgument(
      DictionaryElement argument) sync* {
    final parent = argument.supertype?.element as DictionaryElement?;
    if (parent != null) {
      yield* _expandDictionaryArgument(parent);
    }

    yield* argument.allMembers.map(
      (m) => Parameter(
        (p) => p
          ..name = m.name
          ..named = true
          ..type = _converter.dartTypeRef(m.type as SingleType),
      ),
    );
  }

  @override
  Library visitNamespace(NamespaceElement element) {
    // TODO: implement visitNamespace
    throw UnimplementedError();
  }

  @override
  Library visitOperation(OperationElement element) {
    // TODO: implement visitOperation
    throw UnimplementedError();
  }
}
