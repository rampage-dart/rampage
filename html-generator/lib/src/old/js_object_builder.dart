import 'package:code_builder/code_builder.dart';
import 'package:rampage_html_generator/src/references.dart';
import 'package:recase/recase.dart';
import 'package:web_idl/web_idl.dart';

extension on DictionaryElement {
  Iterable<DictionaryElement> get descendants => [
        'EventInit',
        'UIEventInit',
        'EventModifierInit',
        'MouseEventInit',
      ].contains(name)
          ? [this]
          : const Iterable.empty();
}

class JsObjectBuilder implements ElementVisitor<Spec> {
  @override
  Library visitFragment(FragmentElement element, [Library? context]) {
    throw UnimplementedError();
  }

  @override
  Library visitTypeAlias(TypeAliasElement element, [Library? context]) {
    throw UnimplementedError();
  }

  @override
  Library visitEnum(EnumElement element, [Library? context]) {
    throw UnimplementedError();
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
    final builder = ExtensionBuilder()
      ..name = '${element.name}JsObject'
      ..on = jsObjectReference
      ..methods.add(_dictionaryConstructMethod(element));

    return Library((b) => b..body.add(builder.build()));
  }

  Method _dictionaryConstructMethod(DictionaryElement element) {
    const extendName = 'extend';
    const extendMapName = 'extendWith';

    final parameters = <Parameter>[];
    final namedArguments = <String, Expression>{};

    // Get the supertype members to get the full set of parameters
    var parent = element.supertype?.element as DictionaryElement?;
    while (parent != null) {
      final parentParameters = <Parameter>[];
      for (final member in parent.allMembers) {
        final memberName = member.name.camelCase;

        parentParameters.add(
          Parameter(
            (b) => b
              ..name = memberName
              ..named = true
              ..required = true
              ..type = member.type.reference,
          ),
        );

        namedArguments[memberName] = refer(memberName);
      }
      parameters.insertAll(0, parentParameters);

      parent = parent.supertype?.element as DictionaryElement?;
    }

    // The code_builder library has helpers for creating a Map and its values
    // but it doesn't have the ability to use spread (...) operators so the map
    // is manually written out as Code rather than using an Expression
    final extendMap = StringBuffer();

    // If a dictionary member is nullable then it should only be added to the
    // map if its not null so in JavaScript it ends up as `undefined`
    final extendStatements = <Code>[];

    // Add all members
    for (final member in element.allMembers) {
      final memberName = member.name.camelCase;
      final memberType = member.type;

      parameters.add(
        Parameter(
          (b) => b
            ..name = memberName
            ..named = true
            ..required = true
            ..type = memberType.reference,
        ),
      );

      if (memberType.isNullable) {
        extendStatements.add(
          Code(
            'if ($memberName != null) {'
            "  $extendMapName['$memberName'] = $memberName; "
            '}',
          ),
        );
      } else {
        extendMap.write("'$memberName': $memberName,");
      }
    }

    // Add an extend parameter if there are descendants
    if (element.descendants.isNotEmpty) {
      parameters.add(
        Parameter(
          (b) => b
            ..name = extendName
            ..named = true
            ..type = mapReference(stringReference, objectReference.nullable)
            ..defaultTo =
                literalConstMap({}, stringReference, objectReference.nullable)
                    .code,
        ),
      );
      namedArguments[extendName] = refer(extendMapName);
      extendMap.write('...$extendName');
    }

    // Create the method body
    final supertype = element.supertype;
    late final Expression constructor;

    if (supertype != null) {
      if (extendMap.isNotEmpty) {
        namedArguments[extendName] = refer(extendMapName);
      }
      constructor = refer(supertype.name, '${supertype.name.snakeCase}.dart')
          .property('construct')
          .call(const Iterable.empty(), namedArguments);
    } else {
      constructor =
          jsObjectReference.property('jsify').call([refer(extendMapName)]);
    }

    final code = Block(
      (b) => b
        ..statements.addAll([
          Code('final $extendMapName = <String, Object?>{$extendMap};'),
          ...extendStatements,
          constructor.returned.statement,
        ]),
    );

    return Method(
      (b) => b
        ..name = 'construct'
        ..static = true
        ..returns = jsObjectReference
        ..optionalParameters.addAll(parameters)
        ..body = code,
    );
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
    // TODO: implement visitInterface
    throw UnimplementedError();
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
