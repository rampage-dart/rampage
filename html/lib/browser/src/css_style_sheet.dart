// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'style_sheet.dart';
import 'wrapper.dart';

/// Browser implementation of [CssStyleSheet].
class CssStyleSheetImpl extends StyleSheetImpl implements CssStyleSheet {
  /// Create an instance of [CssStyleSheetImpl].
  factory CssStyleSheetImpl({
    String media = '',
    String title = '',
    bool alternate = false,
    bool disabled = false,
  }) =>
      throw UnimplementedError('CssStyleSheetImpl not implemented');

  /// Create an instance of [CssStyleSheetImpl] from the [jsObject].
  CssStyleSheetImpl.fromJsObject(JsObject jsObject)
      : super.fromJsObject(jsObject);

  /// Create an instance of [CssStyleSheetImpl] from the [jsObject].
  ///
  /// This constructor should be used when its unclear if the [jsObject] has
  /// already been wrapped.
  factory CssStyleSheetImpl.safeFromJsObject(JsObject jsObject) =>
      (jsObject.dartObject ?? CssStyleSheetImpl.fromJsObject(jsObject))
          as CssStyleSheetImpl;

  @override
  void replaceSync(String text) =>
      throw UnimplementedError('replaceSync not implemented');
}
