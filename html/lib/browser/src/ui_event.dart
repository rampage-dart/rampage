// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'event.dart';

/// Browser implementation of [UIEvent].
class UIEventImpl extends EventImpl implements UIEvent {
  /// Creates an instance of [UIEventImpl] from the [jsObject].
  UIEventImpl.fromJsObject(JsObject jsObject)
      : super.fromJsObject(jsObject);

  @override
  Window? get view => throw UnimplementedError('window not implemented');

  @override
  int get detail => throw UnimplementedError('detail not implemented');
}
