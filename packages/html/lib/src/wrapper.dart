// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

/// A Dart object that wraps a [JSObject].
class JsWrapper<T extends JSObject> {
  /// Creates a [JsWrapper] around the [jsObject].
  ///
  /// This should never be called outside of generated code.
  JsWrapper.fromJsObject(this.jsObject);

  /// The wrapped JavaScript object.
  ///
  /// This should never be accessed outside of generated code!
  final T jsObject;
}

/// A bidirectional wrapper between Dart and JavaScript.
class DartJsWrapper<T extends JSObject> implements JsWrapper<T> {
  /// Creates a [DartJsWrapper] around the [jsObject].
  ///
  /// This should never be called outside of generated code.
  DartJsWrapper.fromJsObject(this.jsObject) {
    assert(
      (jsObject as DartWrapper).dartObject == null,
      'Another Dart Object is already attached to the JsObject',
    );
    (jsObject as DartWrapper).dartObject = toJSBox;
  }

  @override
  final T jsObject;
}

/// A JavaScript object that wraps a Dart object.
extension type DartWrapper(JSObject _) implements JSObject {
  @JS(r'$dart')
  external JSBoxedDartObject? dartObject;
}

/// Constructs a [JsWrapper] from a [JSObject].
typedef JsWrapperConstructor<T extends JSObject> =
    JsWrapper<T> Function(T jsObject);

/// Safely retrieves or creates an instance of [JsWrapper] from the [object].
///
/// Checks to see if the [object] already has a [DartWrapper.dartObject] on it.
/// If so then that is returned. Otherwise returns a new [JsWrapper] by calling
/// the [construct] function.
///
/// This should be used whenever it isn't clear if the [Object] has been
/// initialized already.
JsWrapper<T> safeJsWrapperFromObject<T extends JSObject>(
  T object,
  JsWrapperConstructor<T> construct,
) =>
    ((object as DartWrapper).dartObject?.toDart ?? construct(object))
        as JsWrapper<T>;

/// Safely retrieves or creates an instance of [JsWrapper] from the [object] if
/// it is not `null`.
///
/// Checks to see if the [object] already has a [DartWrapper.dartObject] on it.
/// If so then that is returned. Otherwise returns a new [JsWrapper] by calling
/// the [construct] function.
///
/// This should be used whenever it isn't clear if the [Object?] has been
/// initialized already.
JsWrapper<T>? safeJsWrapperFromObjectNullable<T extends JSObject>(
  T? object,
  JsWrapperConstructor<T> construct,
) => object != null ? safeJsWrapperFromObject<T>(object, construct) : null;
