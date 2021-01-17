// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'ui_event.dart';
import 'wrapper.dart';

/// Browser implementation of [FocusEvent].
class FocusEventImpl extends UIEventImpl implements FocusEvent {
  /// Creates an instance of [FocusEventImpl] from the [jsObject].
  FocusEventImpl.fromJsObject(JsObject jsObject) : super.fromJsObject(jsObject);

  /// Create an instance of [FocusEventImpl] from the [jsObject].
  ///
  /// This constructor should be used when its unclear if the [jsObject] has
  /// already been wrapped.
  factory FocusEventImpl.safeFromJsObject(JsObject jsObject) =>
      (jsObject.dartObject ?? FocusEventImpl.fromJsObject(jsObject))
          as FocusEventImpl;

  @override
  EventTarget? get relatedTarget =>
      throw UnimplementedError('relatedTarget not implemented');
}
