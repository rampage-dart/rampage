import 'dart:js';

import 'properties.dart';

extension JsObjectConstructor on JsObject {
  /// Constructs a [JsObject] using a [JsFunction] with the specified [name].
  JsObject construct0(String name) => JsObject(function(name));

  /// Constructs a [JsObject] using a [JsFunction] with the specified [name].
  JsObject construct1<A0>(String name, A0 arg0) =>
      JsObject(function(name), <Object?>[arg0]);

  /// Constructs a [JsObject] using a [JsFunction] with the specified [name].
  JsObject construct2<A0, A1>(String name, A0 arg0, A1 arg1) =>
      JsObject(function(name), <Object?>[arg0, arg1]);

  /// Constructs a [JsObject] using a [JsFunction] with the specified [name].
  JsObject construct3<A0, A1, A2>(String name, A0 arg0, A1 arg1, A2 arg2) =>
      JsObject(function(name), <Object?>[arg0, arg1, arg2]);
}
