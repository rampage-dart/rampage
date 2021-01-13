// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'event.dart';
import 'wrapper.dart';

/// Browser implementation of [CustomEvent].
class CustomEventImpl extends EventImpl implements CustomEvent {
  /// Creates an instance of [CustomEventImpl].
  factory CustomEventImpl(
    String type, {
    bool bubbles = false,
    bool cancelable = false,
    bool composed = false,
    Object? detail,
  }) =>
      throw UnimplementedError('CustomEventImpl not implemented');

  /// Creates an instance of [CustomEventImpl] from the [jsObject].
  CustomEventImpl.fromJsObject(JsObject jsObject)
      : super.fromJsObject(jsObject);

  /// Create an instance of [CustomEventImpl] from the [jsObject].
  ///
  /// This constructor should be used when its unclear if the [jsObject] has
  /// already been wrapped.
  factory CustomEventImpl.safeFromJsObject(JsObject jsObject) =>
      (jsObject.dartObject ?? CustomEventImpl.fromJsObject(jsObject))
          as CustomEventImpl;

  @override
  Object? get detail => throw UnimplementedError('detail not implemented');
}
