// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'package:meta/meta.dart';

import 'js_interop/wrapper.dart' as js;

/// A Dart object that wraps a [JSObject].
@internal
class JsWrapper<T extends JSObject> {
  /// Creates a [JsWrapper] around the [jsObject].
  ///
  /// This should never be called outside of generated code.
  @protected
  JsWrapper.fromJsObject(this.jsObject);

  /// The wrapped JavaScript object.
  ///
  /// This should never be accessed outside of generated code!
  final T jsObject;
}

/// A bidirectional wrapper between Dart and JavaScript.
@internal
class DartJsWrapper<T extends JSObject> implements JsWrapper<T> {
  /// Creates a [DartJsWrapper] around the [jsObject].
  ///
  /// This should never be called outside of generated code.
  @protected
  DartJsWrapper.fromJsObject(this.jsObject) {
    assert(
      (jsObject as js.DartWrapper).dartObject == null,
      'Another Dart Object is already attached to the JsObject',
    );
    (jsObject as js.DartWrapper).dartObject = toJSBox;
  }

  @override
  final T jsObject;
}

/// Constructs a [JsWrapper] from a [JSObject].
@internal
typedef JsWrapperConstructor<T extends JSObject> =
    JsWrapper<T> Function(T jsObject);

/// JS Interop helper for lists of [JsWrapper]s.
@internal
extension JSWrapperList on List<JsWrapper> {
  /// Convert a list of [JsWrapper] into a [JSArray] of their wrapped
  /// [JSObject]s.
  JSArray get toJS => map((w) => w.jsObject).toList(growable: false).toJS;
}

/// Safely retrieves or creates an instance of [JsWrapper] from the [object].
///
/// Checks to see if the [object] already has a [js.DartWrapper.dartObject] on
/// it.If so then that is returned. Otherwise returns a new [JsWrapper] by
/// calling the [construct] function.
///
/// This should be used whenever it isn't clear if the [Object] has been
/// initialized already.
@internal
JsWrapper<T> safeJsWrapperFromJsObject<T extends JSObject>(
  T object,
  JsWrapperConstructor<T> construct,
) =>
    ((object as js.DartWrapper).dartObject?.toDart ?? construct(object))
        as JsWrapper<T>;

/// Safely retrieves or creates an instance of [JsWrapper] from the [object] if
/// it is not `null`.
///
/// Checks to see if the [object] already has a [js.DartWrapper.dartObject] on
/// it. If so then that is returned. Otherwise returns a new [JsWrapper] by
/// calling the [construct] function.
///
/// This should be used whenever it isn't clear if the [Object?] has been
/// initialized already.
@internal
JsWrapper<T>? safeJsWrapperFromJsObjectNullable<T extends JSObject>(
  T? object,
  JsWrapperConstructor<T> construct,
) => object != null ? safeJsWrapperFromJsObject<T>(object, construct) : null;
