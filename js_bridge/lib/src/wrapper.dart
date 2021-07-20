// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

/// A Dart object that wraps a [JsObject].
class JsWrapper {
  /// Creates a [JsWrapper] around the [jsObject].
  JsWrapper.fromJsObject(this.jsObject);

  /// The wrapped JavaScript object.
  final JsObject jsObject;
}

/// A bidirectional wrapper between
class DartJsWrapper implements JsWrapper {
  /// Creates a [DartJsWrapper] around the [jsObject].
  DartJsWrapper.fromJsObject(this.jsObject) {
    jsObject.dartObject = this;
  }

  @override
  final JsObject jsObject;
}

/// A JavaScript object that wraps a Dart object.
extension DartWrapper on JsObject {
  static const String _dartObject = 'dartObject';

  /// The wrapped Dart object.
  ///
  /// A JavaScript object may only wrap a single Dart object. If the value is
  /// set twice the application will assert.
  Object? get dartObject => this[_dartObject];
  set dartObject(Object? value) {
    assert(
      value != null && dartObject == null,
      'Another Dart Object is already attached to the JsObject',
    );
    this[_dartObject] = value;
  }
}

/// Retrieves the [JsObject] wrapped by the [dartObject].
JsObject fromDartObject(Object dartObject) =>
    (dartObject as JsWrapper).jsObject;

/// Retrieves the [JsObject] wrapped by the [dartObject] if present.
JsObject? fromDartObjectNullable(Object? dartObject) =>
    dartObject != null ? fromDartObject(dartObject) : null;
