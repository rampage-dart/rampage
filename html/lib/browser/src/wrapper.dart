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

/// Retrieves the [JsObject] on the [dartObject].
///
/// Casts the [dartObject] to a [JsWrapper] and grabs its value.
JsObject toJsObject(Object dartObject) => (dartObject as JsWrapper).jsObject;

/// Retrieves the [JsObject] on the [dartObject] or `null`.
JsObject? toJsObjectNullable(Object? dartObject) =>
    dartObject != null ? toJsObject(dartObject) : null;

/// Constructs a [JsWrapper] from a [JsObject].
typedef JsWrapperConstructor = JsWrapper Function(JsObject jsObject);

/// Safely retrieves or creates an instance of [JsWrapper] from the [object].
///
/// Checks to see if the [object] already has a [DartWrapper.dartObject] on it.
/// If so then that is returned. Otherwise returns a new [JsWrapper] by calling
/// the [construct] function.
///
/// This should be used whenever it isn't clear if the [Object] has been
/// initialized already.
T safeJsWrapperFromObject<T extends JsWrapper>(
  Object object,
  JsWrapperConstructor construct,
) {
  final jsObject = JsObject.fromBrowserObject(object);

  return (jsObject.dartObject ?? construct(jsObject)) as T;
}

/// Safely retrieves or creates an instance of [JsWrapper] from the [object] if
/// it is not `null`.
///
/// Checks to see if the [object] already has a [DartWrapper.dartObject] on it.
/// If so then that is returned. Otherwise returns a new [JsWrapper] by calling
/// the [construct] function.
///
/// This should be used whenever it isn't clear if the [Object?] has been
/// initialized already.
T? safeJsWrapperFromObjectNullable<T extends JsWrapper>(
  Object? object,
  JsWrapperConstructor construct,
) =>
    object != null ? safeJsWrapperFromObject<T>(object, construct) : null;
