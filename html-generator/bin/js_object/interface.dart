import 'package:code_builder/code_builder.dart';

import 'references.dart';

class InterfaceElement {
  String name = '';
}

String interfaceName(InterfaceElement element) => '${element.name}JsObject';

ExtensionBuilder interfaceJsObject(InterfaceElement element) {
  final builder = ExtensionBuilder()
    ..name = interfaceName(element)
    ..on = jsObjectReference;

  final jsName = element.name;

  // Add a getter for the constructor if necessary
  final constructorOnContext = refer('context')
      .property('function')
      .call(<Expression>[literalString(jsName)]);
  late final Expression constructorGetter;

  if (_shouldGenerateConstructor(element)) {
    const constructorGetterName = '_constructor';

    builder.methods.add(
      Method(
        (b) => b
          ..name = constructorGetterName
          ..type = MethodType.getter
          ..returns = jsFunctionReference
          ..body = constructorOnContext.code,
      ),
    );

    constructorGetter = refer(constructorGetterName);
  } else {
    constructorGetter = constructorOnContext;
  }

  // Add an isInstanceOf getter
  builder.methods.add(Method((b) => b
    ..name = 'isInstanceOf'
    ..type = MethodType.getter
    ..returns = boolReference
    ..body = refer('instanceof').call(<Expression>[constructorGetter]).code));

  // Code('instanceof($constructorGetter)')));

  return builder;
}

bool _shouldGenerateConstructor(InterfaceElement element) => false;
