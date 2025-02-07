// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:change_case/change_case.dart';
import 'package:code_builder/code_builder.dart';
import 'package:web_idl/web_idl.dart';

import 'generator_command.dart';
import 'source_generator.dart';
import 'type_converter.dart';

extension on TypeReference {
  TypeReference withPrefix(String prefix) => TypeReference(
    (t) =>
        t
          ..symbol = '$prefix.$symbol'
          ..url = url
          ..types.addAll(types),
  );

  TypeReference withTypeParam(TypeReference reference) => TypeReference(
    (t) =>
        t
          ..symbol = symbol
          ..url = url
          ..types.add(reference),
  );
}

final class DartGenerator extends SourceGenerator {
  @override
  TypeConverter typeConverter(TypeMap? mapping) => TypeConverter.dart(mapping);

  @override
  Iterable<Directive> directives() => <Directive>[
    Directive.import('package:rampage_js_interop/js_interop.dart', as: 'js'),
  ];

  @override
  Iterable<Spec> enumeration(EnumElement element) sync* {
    final enumValues = element.values.map(_enumerationValue);

    yield Enum(
      (e) =>
          e
            ..name = element.name
            ..values.addAll(
              enumValues.map(
                (r) => EnumValue(
                  (v) =>
                      v
                        ..name = r.name
                        ..arguments.add(literalString(r.value)),
                ),
              ),
            )
            ..constructors.add(
              Constructor(
                (c) =>
                    c
                      ..constant = true
                      ..requiredParameters.add(
                        Parameter(
                          (p) =>
                              p
                                ..name = 'toJS'
                                ..toThis = true,
                        ),
                      ),
              ),
            )
            ..fields.add(
              Field(
                (f) =>
                    f
                      ..name = 'toJS'
                      ..modifier = FieldModifier.final$
                      ..type = TypeConverter.dartString,
              ),
            ),
    );

    final methodBody =
        StringBuffer()..writeAll([
          'switch (this) {',
          ...enumValues.map(
            (r) => "'${r.value}' => ${element.name}.${r.name},",
          ),
          "_ => throw UnsupportedError('\$this is not a member of ${element.name}'),}",
        ]);

    yield Extension(
      (e) =>
          e
            ..name = '${element.name}DartObject'
            ..on = TypeConverter.dartString
            ..methods.add(
              Method(
                (m) =>
                    m
                      ..name = 'toDart'
                      ..returns = types.convertSingleType(element.thisType)
                      ..type = MethodType.getter
                      ..lambda = true
                      ..body = Code(methodBody.toString()),
              ),
            ),
    );
  }

  ({String name, String value}) _enumerationValue(String value) {
    final name = switch (value) {
      'default' => 'default_',
      '2d' => 'canvas',
      '' => 'empty',
      _ => value.toCamelCase(),
    };

    return (name: name, value: value);
  }

  @override
  Iterable<Spec> interface(InterfaceElement element) sync* {
    final library = element.enclosingElement as FragmentElement;
    final mixins = library.includes
        .where((e) => e.on.name == element.name)
        .map((e) => types.convert(e.mixin));

    final methods = [...element.allAttributes.expand(_interfaceAttribute)];

    if (element.isMixin) {
      yield Mixin(
        (m) =>
            m
              ..name = element.name
              ..on = _dartJsWrapper(TypeConverter.jsObject)
              ..implements.addAll(mixins)
              ..methods.addAll(methods),
      );
    } else {
      final hasSubclass =
          _hackHasSubclass.contains(element.name) ||
          library.interfaces
                  .where((e) => e.supertype?.name == element.name)
                  .firstOrNull !=
              null;

      final jsObjectType = _toJsTypeReference(
        types.convertSingleType(element.thisType),
      );

      final supertype = element.supertype;
      final extendType = hasSubclass ? _genericType : jsObjectType;
      final extend =
          supertype != null
              ? types.convertSingleType(supertype).withTypeParam(extendType)
              : _dartJsWrapper(extendType);

      yield Class(
        (e) =>
            e
              ..name = element.name
              ..extend = extend
              ..types.addAll([
                if (hasSubclass)
                  TypeReference(
                    (t) =>
                        t
                          ..symbol = 'T'
                          ..bound = jsObjectType,
                  ),
              ])
              ..modifier = !hasSubclass ? ClassModifier.final$ : null
              ..constructors.add(_fromJsObjectConstructor(hasSubclass))
              ..methods.addAll(methods),
      );

      if (_hackMakeSafeFromObject.contains(element.name)) {
        final type =
            hasSubclass ? TypeReference((t) => t..symbol = 'T') : jsObjectType;
        final typeBound = type.rebuild((t) => t.bound = jsObjectType);
        final nullableType = type.rebuild((t) => t.isNullable = true);
        final call =
            hasSubclass
                ? '<T>(jsObject, ${element.name.toCamelCase()}FromJsObject)'
                : '(jsObject, ${element.name}.fromJsObject)';

        yield Method(
          (m) =>
              m
                ..name = 'safe${element.name}FromJsObject'
                ..returns = _jsWrapper(type)
                ..types.addAll([if (hasSubclass) typeBound])
                ..requiredParameters.add(
                  Parameter(
                    (p) =>
                        p
                          ..name = 'jsObject'
                          ..type = type,
                  ),
                )
                ..lambda = true
                ..body = Code('safeJsWrapperFromObject$call'),
        );

        yield Method(
          (m) =>
              m
                ..name = 'safe${element.name}FromJsObjectNullable'
                ..returns = _jsWrapper(
                  type,
                ).rebuild((t) => t..isNullable = true)
                ..types.addAll([if (hasSubclass) typeBound])
                ..requiredParameters.add(
                  Parameter(
                    (p) =>
                        p
                          ..name = 'jsObject'
                          ..type = nullableType,
                  ),
                )
                ..lambda = true
                ..body = Code('safeJsWrapperFromObjectNullable$call'),
        );
      }
    }
  }

  Iterable<Method> _interfaceAttribute(AttributeElement element) sync* {
    final type = types.convert(element.type);

    final getter = Method(
      (m) =>
          m
            ..name = element.name
            ..type = MethodType.getter
            ..returns = type
            ..lambda = true
            ..body = refer('jsObject.${element.name}').code,
    );

    yield getter;

    if (element.readWrite) {
      final setter = Method(
        (m) =>
            m
              ..name = element.name
              ..type = MethodType.setter
              ..requiredParameters.add(
                Parameter(
                  (p) =>
                      p
                        ..name = 'value'
                        ..type = type,
                ),
              )
              ..body = Code('jsObject.${element.name} = value;'),
      );

      yield setter;
    }
  }

  static Constructor _fromJsObjectConstructor(bool protected) => Constructor(
    (c) =>
        c
          ..name = 'fromJsObject'
          ..annotations.addAll([
            if (protected)
              const Reference('protected', 'package:meta/meta.dart'),
          ])
          ..requiredParameters.add(
            Parameter(
              (p) =>
                  p
                    ..name = 'jsObject'
                    ..toSuper = true,
            ),
          )
          ..initializers.add(const Code('super.fromJsObject()')),
  );

  static TypeReference _toJsTypeReference(TypeReference reference) =>
      TypeReference((t) => t..symbol = 'js.${reference.symbol}');

  static TypeReference _jsWrapper(TypeReference reference) => TypeReference(
    (t) =>
        t
          ..symbol = 'JsWrapper'
          ..url = 'wrapper.dart'
          ..types.add(reference),
  );

  static TypeReference _dartJsWrapper(TypeReference reference) => TypeReference(
    (t) =>
        t
          ..symbol = 'DartJsWrapper'
          ..url = 'wrapper.dart'
          ..types.add(reference),
  );

  static final TypeReference _genericType = TypeReference(
    (t) => t..symbol = 'T',
  );

  static const List<String> _hackMakeSafeFromObject = <String>[
    'EventTarget',
    'Node',
    'Element',
    'HTMLElement',
    'HTMLHeadElement',
    'HTMLSlotElement',
  ];

  static const List<String> _hackHasSubclass = <String>[
    'Event',
    'EventTarget',
    'Element',
  ];
}

final class DartGeneratorCommand extends GeneratorCommand {
  DartGeneratorCommand() : super(DartGenerator());

  @override
  final String name = 'dart';
  @override
  final String description = '';
}
