// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:code_builder/code_builder.dart';
import 'package:web_idl/web_idl.dart';

import 'generator_command.dart';
import 'source_generator.dart';
import 'type_converter.dart';

extension on DictionaryElement {
  Iterable<DictionaryMemberElement> get allInheritedMembers sync* {
    if (supertype != null) {
      yield* (supertype!.element as DictionaryElement).allInheritedMembers;
    }

    yield* allMembers;
  }
}

extension on OperationElement {
  Iterable<ArgumentElement> get requiredArguments =>
      arguments.where(_isRequired);
  Iterable<ArgumentElement> get optionalArguments =>
      arguments.where(_isOptional);

  static bool _isRequired(ArgumentElement element) => element.isRequired;
  static bool _isOptional(ArgumentElement element) => element.isOptional;
}

final class JsInteropGenerator extends SourceGenerator {
  @override
  TypeConverter typeConverter(TypeMap? mapping) =>
      TypeConverter.jsInterop(mapping);

  @override
  Iterable<Spec> dictionary(DictionaryElement element) sync* {
    yield ExtensionType(
      (e) =>
          e
            ..name = element.name
            ..representationDeclaration = RepresentationDeclaration(
              (r) =>
                  r
                    ..name = '_'
                    ..declaredRepresentationType = TypeConverter.jsObject,
            )
            ..implements.addAll([
              TypeConverter.jsObject,
              if (element.supertype != null)
                types.convertSingleType(element.supertype!),
            ])
            ..primaryConstructorName = '_'
            ..constructors.add(_dictionaryConstructor(element))
            ..methods.addAll(element.allMembers.expand(_dictionaryField)),
    );
  }

  Iterable<Method> _dictionaryField(DictionaryMemberElement element) sync* {
    final type = types.convert(element.type);

    final getter = Method(
      (m) =>
          m
            ..name = element.name
            ..external = true
            ..type = MethodType.getter
            ..returns = type,
    );

    yield getter;

    final setter = Method(
      (m) =>
          m
            ..name = element.name
            ..external = true
            ..type = MethodType.setter
            ..requiredParameters.add(
              Parameter(
                (p) =>
                    p
                      ..name = 'value'
                      ..type = type,
              ),
            ),
    );

    yield setter;
  }

  Constructor _dictionaryConstructor(DictionaryElement element) => Constructor(
    (c) =>
        c
          ..factory = true
          ..external = true
          ..optionalParameters.addAll(
            element.allInheritedMembers.map(_dictionaryConstructorParameter),
          ),
  );

  Parameter _dictionaryConstructorParameter(DictionaryMemberElement element) =>
      Parameter(
        (p) =>
            p
              ..name = element.name
              ..type = types.convert(element.type)
              ..named = true,
      );

  @override
  Iterable<Spec> enumeration(EnumElement element) sync* {
    yield TypeDef(
      (t) =>
          t
            ..name = element.name
            ..definition = refer('String'),
    );
  }

  @override
  Iterable<Spec> function(FunctionTypeAliasElement element) sync* {
    yield TypeDef(
      (t) =>
          t
            ..name = element.name
            ..definition = refer('JSFunction'),
    );
  }

  @override
  Iterable<Spec> interface(InterfaceElement element) sync* {
    yield ExtensionType(
      (e) =>
          e
            ..name = element.name
            ..representationDeclaration = RepresentationDeclaration(
              (r) =>
                  r
                    ..name = '_'
                    ..declaredRepresentationType = TypeConverter.jsObject,
            )
            ..implements.addAll([
              TypeConverter.jsObject,
              if (element.supertype != null)
                types.convertSingleType(element.supertype!),
              ...(element.enclosingElement as FragmentElement).includes
                  .where((e) => e.on.name == element.name)
                  .map((e) => types.convert(e.mixin)),
            ])
            ..primaryConstructorName = '_'
            ..constructors.addAll(
              element.allConstructors.map(_interfaceConstructor),
            )
            ..methods.addAll([
              ...element.allAttributes.expand(_interfaceAttribute),
              ...element.allOperations.map(_interfaceOperation),
            ]),
      //..fields.addAll(element.constants.map(_interfaceConstant))
    );
  }

  Constructor _interfaceConstructor(OperationElement element) {
    final name = element.name;

    return Constructor(
      (c) =>
          c
            ..name = name != 'constructor' ? name : null
            ..external = true
            ..factory = true
            ..requiredParameters.addAll(
              element.requiredArguments.map(_interfaceOperationArgument),
            )
            ..optionalParameters.addAll(
              element.optionalArguments.map(_interfaceOperationArgument),
            ),
    );
  }

  Iterable<Method> _interfaceAttribute(AttributeElement element) sync* {
    final type = types.convert(element.type);

    final getter = Method(
      (m) =>
          m
            ..name = element.name
            ..external = true
            ..type = MethodType.getter
            ..returns = type,
    );

    yield getter;

    if (element.readWrite) {
      final setter = Method(
        (m) =>
            m
              ..name = element.name
              ..external = true
              ..type = MethodType.setter
              ..requiredParameters.add(
                Parameter(
                  (p) =>
                      p
                        ..name = 'value'
                        ..type = type,
                ),
              ),
      );

      yield setter;
    }
  }

  Field _interfaceConstant(ConstantElement element) => Field(
    (f) =>
        f
          ..name = element.name
          ..type = types.convert(element.type)
          ..static = true,
  );

  Method _interfaceOperation(OperationElement element) => Method(
    (m) =>
        m
          ..name = element.name
          ..external = true
          ..returns = types.convert(element.returnType)
          ..static = element.isStatic
          ..requiredParameters.addAll(
            element.requiredArguments.map(_interfaceOperationArgument),
          )
          ..optionalParameters.addAll(
            element.optionalArguments.map(_interfaceOperationArgument),
          ),
  );

  Parameter _interfaceOperationArgument(ArgumentElement element) => Parameter(
    (p) =>
        p
          ..name = element.name
          ..type = types.convert(element.type),
  );

  @override
  Iterable<Spec> namespace(NamespaceElement element) sync* {
    yield ExtensionType(
      (e) =>
          e
            ..name = element.name
            ..representationDeclaration = RepresentationDeclaration(
              (r) =>
                  r
                    ..name = '_'
                    ..declaredRepresentationType = TypeConverter.jsObject,
            )
            ..implements.add(TypeConverter.jsObject)
            ..primaryConstructorName = '_',
    );

    yield Method(
      (f) =>
          f
            ..name = element.name
            ..external = true
            ..type = MethodType.getter
            ..returns = refer(element.name),
    );
  }

  @override
  Iterable<Spec> typeDefinition(TypeAliasElement element) sync* {
    yield TypeDef(
      (t) =>
          t
            ..name = element.name
            ..definition = types.convert(element.type),
    );
  }
}

final class JsInteropGeneratorCommand extends GeneratorCommand {
  JsInteropGeneratorCommand() : super(JsInteropGenerator());

  @override
  final String name = 'js_interop';
  @override
  final String description = '';
}
