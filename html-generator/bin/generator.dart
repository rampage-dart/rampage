import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:rampage_html_generator/src/old/implementation_builder.dart';
import 'package:rampage_html_generator/src/old/interface_builder.dart';
import 'package:web_idl/src/parser/element_builder.dart' as web_idl;
import 'package:web_idl/src/parser/context.dart' as web_idl;

void main() {
  final enumeration = web_idl.EnumBuilder(web_idl.WebIdlContext())
    ..name = 'ResizeObserverBoxOptions'
    ..values = <String>[
      'border-box',
      'content-box',
      'device-pixel-content-box'
    ];

  final emitter = DartEmitter(orderDirectives: true, useNullSafetySyntax: true);

  final implementation = ImplementationBuilder();
  final impl = implementation.visitEnum(enumeration.build());

  final interface = InterfaceBuilder();
  final inter = interface.visitEnum(enumeration.build());

  print(DartFormatter().format(impl.accept(emitter).toString()));
  print(DartFormatter().format(inter.accept(emitter).toString()));
}

/*
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

import 'js_object/interface.dart';

class DictionaryElement {
  final String name;
  final DictionaryElement? parent;

  final bool hasDescendants;
  final List<AttributeElement> attributes;

  DictionaryElement(
    this.name, {
    this.parent,
    this.hasDescendants = false,
    this.attributes = const <AttributeElement>[],
  });
}

class AttributeElement {
  final String name;
  final String type;
  final bool readOnly;

  AttributeElement(this.name, {this.type = 'Object', this.readOnly = false});
}

Reference _toDartReference(String type) {
  switch (type) {
    case 'DOMString':
    case 'USVString':
      return const Reference('String');
    case 'boolean':
      return const Reference('bool');
    case 'int':
      return const Reference('int');
  }

  return const Reference('JsObject', 'dart:js');
}

ExtensionBuilder dictionaryJsObject(DictionaryElement element) {
  final builder = ExtensionBuilder()
    ..name = '${element.name}JsObject'
    ..on = refer('JsObject', 'dart:js')
    ..methods.add(_constructMethod(element).build());

  for (final attribute in element.attributes) {
    builder.methods.add(_constructGetter(attribute).build());

    if (!attribute.readOnly) {
      builder.methods.add(_constructSetter(attribute).build());
    }
  }

  return builder;
}

MethodBuilder _constructGetter(AttributeElement element) {
  final builder = MethodBuilder()
    ..name = element.name
    ..returns = refer('String')
    ..type = MethodType.getter
    ..body =
        refer('string').call(<Expression>[literalString(element.name)]).code;

  return builder;
}

MethodBuilder _constructSetter(AttributeElement element) {
  assert(!element.readOnly, 'attribute is read only');

  const setterName = 'value';
  final name = element.name;
  final valueParam = ParameterBuilder()
    ..name = setterName
    ..type = refer('String');
  final builder = MethodBuilder()
    ..name = name
    ..type = MethodType.setter
    ..body = refer('setString').call(<Expression>[
      literalString(name),
      refer(setterName),
    ]).statement
    ..requiredParameters.add(valueParam.build());

  return builder;
}

MethodBuilder _constructMethod(DictionaryElement element) {
  final builder = MethodBuilder()
    ..name = 'construct'
    ..static = true
    ..returns = const Reference('JsObject', 'dart:js');

  // Iterate through the attributes to create parameters
  final parameters = <ParameterBuilder>[];
  final arguments = StringBuffer();
  final extendMap = StringBuffer();

  // Get the parent attributes to get the full set of parameters
  var parent = element.parent;
  while (parent != null) {
    final parentParameters = parent.attributes.map<ParameterBuilder>(
      (attribute) => ParameterBuilder()
        ..name = attribute.name
        ..named = true
        ..required = true
        ..type = _toDartReference(attribute.type),
    );
    parameters.insertAll(0, parentParameters);

    parent = parent.parent;
  }

  for (final parameter in parameters) {
    arguments.write('${parameter.name}: ${parameter.name},');
  }

  // Add all attributes
  for (final attribute in element.attributes) {
    final parameter = ParameterBuilder()
      ..name = attribute.name
      ..named = true
      ..required = true
      ..type = _toDartReference(attribute.type);

    parameters.add(parameter);
    extendMap.write("'${attribute.name}': ${attribute.name},");
  }

  // Add an extends parameter if there are descendants
  if (element.hasDescendants) {
    final extendParameter = ParameterBuilder()
      ..name = 'extend'
      ..named = true
      ..type = const Reference('Map<String, Object?>')
      ..defaultTo = const Code('const <String, Object?>{}');

    parameters.add(extendParameter);
    extendMap.write('...extend,');
  }

  // Create the method body
  late final String jsConstructor;
  final extendMapCode = '<String, Object?>{$extendMap}';
  if (element.parent != null) {
    jsConstructor = '${element.parent!.name}JsObject.construct';
    arguments.write('extend: $extendMapCode,');
  } else {
    jsConstructor = 'JsObject.jsify';
    arguments.write(extendMapCode);
  }

  builder
    ..optionalParameters.addAll(parameters.map((p) => p.build()))
    ..lambda = true
    ..body = Code('$jsConstructor($arguments)');

  return builder;
}

void main() {

  final captureParam = ParameterBuilder()
    ..name = 'capture'
    ..named = true
    ..type = const Reference('bool')
    ..required = true;

  final extendParam = ParameterBuilder()
    ..name = 'extend'
    ..named = true
    ..type = const Reference('Map<String, Object?>')
    ..defaultTo = const Code('const <String, Object?>{}');

  final construct = MethodBuilder()
    ..returns = refer('JsObject', 'dart:js')
    ..static = true
    ..name = 'construct'
    ..lambda = true;

  construct.requiredParameters
    ..add(captureParam.build())
    ..add(extendParam.build());

  construct.body = const Code('JsObject.jsify(<String, Object?>{})');

  final eventListenerDictionary = DictionaryElement(
    'EventListenerOptions',
    hasDescendants: true,
    attributes: <AttributeElement>[
      AttributeElement('capture', type: 'boolean')
    ],
  );

  final addEventListenerDictionary = DictionaryElement(
    'AddEventListenerOptions',
    parent: eventListenerDictionary,
    hasDescendants: false,
    attributes: <AttributeElement>[
      AttributeElement('passive', type: 'boolean'),
      AttributeElement('once', type: 'once'),
    ],
  );

  final library = LibraryBuilder()
    ..directives.addAll([
      Directive.import('dart:js'),
      Directive.import('package:js_bridge/js_bridge.dart'),
      Directive.import('foo.dart'),
    ])
    ..body.addAll([
      dictionaryJsObject(eventListenerDictionary).build(),
      dictionaryJsObject(addEventListenerDictionary).build(),
      interfaceJsObject(InterfaceElement()..name = 'HTMLBodyElement').build(),
    ]);

  final emitter = DartEmitter(orderDirectives: true, useNullSafetySyntax: true);
  //print(library.build().accept(emitter));
  print(DartFormatter().format('${library.build().accept(emitter)}'));
}
*/
