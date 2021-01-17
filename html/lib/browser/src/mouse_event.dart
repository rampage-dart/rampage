// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'ui_event.dart';
import 'wrapper.dart';

/// Browser implementation of [MouseEvent].
class MouseEventImpl extends UIEventImpl implements MouseEvent {
  /// Creates an instance of [MouseEventImpl] from the [jsObject].
  MouseEventImpl.fromJsObject(JsObject jsObject) : super.fromJsObject(jsObject);

  /// Create an instance of [MouseEventImpl] from the [jsObject].
  ///
  /// This constructor should be used when its unclear if the [jsObject] has
  /// already been wrapped.
  factory MouseEventImpl.safeFromJsObject(JsObject jsObject) =>
      (jsObject.dartObject ?? MouseEventImpl.fromJsObject(jsObject))
          as MouseEventImpl;

  @override
  int get screenX => throw UnimplementedError('screenX not implemented');

  @override
  int get screenY => throw UnimplementedError('screenY not implemented');

  @override
  int get clientX => throw UnimplementedError('clientX not implemented');

  @override
  int get clientY => throw UnimplementedError('clientY not implemented');

  @override
  bool get ctrlKey => throw UnimplementedError('ctrlKey not implemented');

  @override
  bool get shiftKey => throw UnimplementedError('shiftKey not implemented');

  @override
  bool get altKey => throw UnimplementedError('altKey not implemented');

  @override
  bool get metaKey => throw UnimplementedError('metaKey not implemented');

  @override
  int get button => throw UnimplementedError('button not implemented');

  @override
  EventTarget? get relatedTarget =>
      throw UnimplementedError('relatedTarget not implemented');
}
