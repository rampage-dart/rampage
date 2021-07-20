// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

/// Contains helpers for interacting with callbacks between Dart and JavaScript
/// code.
///
/// The callback function's argument types are completely generic, due to Dart
/// not supporting union types, but in practice the types sent from JavaScript
/// are limited.
///
///     typedef ArgumentTypes =
///         bool |
///         int  |
///         double |
///         String |
///         JsObject |
///         Null
///
///
library rampage_html.js_bridge.src.callback;

import 'dart:js';

/// A Dart function with no arguments that is called by JavaScript code.
typedef Callback0<R> = R Function(Object? scope);

/// A Dart function with one argument that is called by JavaScript code.
typedef Callback1<R, A0> = R Function(Object? scope, A0 arg0);

/// A Dart function with two arguments that is called by JavaScript code.
typedef Callback2<R, A0, A1> = R Function(Object? scope, A0 arg0, A1 arg1);

/// A Dart function with three arguments that is called by JavaScript code.
typedef Callback3<R, A0, A1, A2> = R Function(
  Object? scope,
  A0 arg0,
  A1 arg1,
  A2 arg2,
);

/// A Dart function with four arguments that is called by JavaScript code.
typedef Callback4<R, A0, A1, A2, A3> = R Function(
  Object? scope,
  A0 arg0,
  A1 arg1,
  A2 arg2,
  A3 arg3,
);

/// A Dart function with five arguments that is called by JavaScript code.
typedef Callback5<R, A0, A1, A2, A3, A4> = R Function(
  Object? scope,
  A0 arg0,
  A1 arg1,
  A2 arg2,
  A3 arg3,
  A4 arg4,
);

/// Converts a Dart function with no arguments to a [JsFunction].
JsFunction callback0<R>(Callback0<R> func) => JsFunction.withThis(func);

/// Converts a Dart function with one argument to a [JsFunction].
JsFunction callback1<R, A0>(Callback1<R, A0> func) => JsFunction.withThis(func);

/// Converts a Dart function with two arguments to a [JsFunction].
JsFunction callback2<R, A0, A1>(Callback2<R, A0, A1> func) =>
    JsFunction.withThis(func);

/// Converts a Dart function with three arguments to a [JsFunction].
JsFunction callback3<R, A0, A1, A2>(Callback3<R, A0, A1, A2> func) =>
    JsFunction.withThis(func);

/// Converts a Dart function with four arguments to a [JsFunction].
JsFunction callback4<R, A0, A1, A2, A3>(Callback4<R, A0, A1, A2, A3> func) =>
    JsFunction.withThis(func);

/// Converts a Dart function with five arguments to a [JsFunction].
JsFunction callback5<R, A0, A1, A2, A3, A4>(
  Callback5<R, A0, A1, A2, A3, A4> func,
) =>
    JsFunction.withThis(func);

extension JsObjectCallbacks on JsObject {
  /// Attach the [callback] to the [property].
  void setCallback0<R>(String property, Callback0<R> callback) {
    this[property] = callback0<R>(callback);
  }

  /// Attach the [callback] to the [property].
  void setCallback1<R, A0>(String property, Callback1<R, A0> callback) {
    this[property] = callback1<R, A0>(callback);
  }

  /// Attach the [callback] to the [property].
  void setCallback2<R, A0, A1>(String property, Callback2<R, A0, A1> callback) {
    this[property] = callback2<R, A0, A1>(callback);
  }

  /// Attach the [callback] to the [property].
  void setCallback3<R, A0, A1, A2>(
    String property,
    Callback3<R, A0, A1, A2> callback,
  ) {
    this[property] = callback3<R, A0, A1, A2>(callback);
  }

  /// Attach the [callback] to the [property].
  void setCallback4<R, A0, A1, A2, A3>(
    String property,
    Callback4<R, A0, A1, A2, A3> callback,
  ) {
    this[property] = callback4<R, A0, A1, A2, A3>(callback);
  }

  /// Attach the [callback] to the [property].
  void setCallback5<R, A0, A1, A2, A3, A4>(
    String property,
    Callback5<R, A0, A1, A2, A3, A4> callback,
  ) {
    this[property] = callback5<R, A0, A1, A2, A3, A4>(callback);
  }
}
