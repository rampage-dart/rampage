// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'ui_event.dart';
import 'wrapper.dart';

/// Browser implementation of [KeyboardEvent].
class KeyboardEventImpl extends UIEventImpl implements KeyboardEvent {
  /// Creates an instance of [KeyboardEventImpl] from the [jsObject].
  KeyboardEventImpl.fromJsObject(JsObject jsObject)
      : super.fromJsObject(jsObject);

  /// Create an instance of [KeyboardEventImpl] from the [jsObject].
  ///
  /// This constructor should be used when its unclear if the [jsObject] has
  /// already been wrapped.
  factory KeyboardEventImpl.safeFromJsObject(JsObject jsObject) =>
      (jsObject.dartObject ?? KeyboardEventImpl.fromJsObject(jsObject))
          as KeyboardEventImpl;

  @override
  String get key => throw UnimplementedError('key not implemented');

  @override
  String get code => throw UnimplementedError('code not implemented');

  @override
  bool get ctrlKey => throw UnimplementedError('ctrlKey not implemented');

  @override
  bool get shiftKey => throw UnimplementedError('shiftKey not implemented');

  @override
  bool get altKey => throw UnimplementedError('altKey not implemented');

  @override
  bool get metaKey => throw UnimplementedError('metaKey not implemented');

  @override
  bool get repeat => throw UnimplementedError('repeat not implemented');
}
