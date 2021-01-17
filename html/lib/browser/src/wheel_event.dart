// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'ui_event.dart';
import 'wrapper.dart';

/// Browser implementation of [WheelEvent].
class WheelEventImpl extends UIEventImpl implements WheelEvent {
  /// Creates an instance of [WheelEventImpl] from the [jsObject].
  WheelEventImpl.fromJsObject(JsObject jsObject) : super.fromJsObject(jsObject);

  /// Create an instance of [WheelEventImpl] from the [jsObject].
  ///
  /// This constructor should be used when its unclear if the [jsObject] has
  /// already been wrapped.
  factory WheelEventImpl.safeFromJsObject(JsObject jsObject) =>
      (jsObject.dartObject ?? WheelEventImpl.fromJsObject(jsObject))
          as WheelEventImpl;

  @override
  double get deltaX => throw UnimplementedError('deltaX not implemented');

  @override
  double get deltaY => throw UnimplementedError('deltaY not implemented');

  @override
  double get deltaZ => throw UnimplementedError('deltaZ not implemented');
}
