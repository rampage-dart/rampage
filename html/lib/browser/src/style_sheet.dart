// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'wrapper.dart';

/// Browser implementation of [StyleSheet].
class StyleSheetImpl extends DartJsWrapper implements StyleSheet {
  /// Creates an instance of [StyleSheetImpl] from the [JsObject].
  StyleSheetImpl.fromJsObject(JsObject jsObject) : super.fromJsObject(jsObject);

  @override
  String get type => throw UnimplementedError('type not implemented');

  @override
  String? get href => throw UnimplementedError('href not implemented');

  @override
  String? get title => throw UnimplementedError('title not implemented');

  @override
  bool get disabled => throw UnimplementedError('disabled not implemented');
}
