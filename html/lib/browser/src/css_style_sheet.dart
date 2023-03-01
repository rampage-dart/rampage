// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'js/css_style_sheet.dart';
import 'js/css_style_sheet_init.dart';
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
      CssStyleSheetImpl.fromJsObject(
        CssStyleSheetJsObject.construct(
          CssStyleSheetInitJsObject.construct(
            media: media,
            title: title,
            alternate: alternate,
            disabled: disabled,
          ),
        ),
      );

  /// Create an instance of [CssStyleSheetImpl] from the [jsObject].
  CssStyleSheetImpl.fromJsObject(super.jsObject) : super.fromJsObject();

  @override
  void replaceSync(String text) {
    jsObject.replaceSync(text);
  }
}

// \TODO Remove if constructor tear-offs are added to the language
CssStyleSheetImpl _constructor(JsObject jsObject) =>
    CssStyleSheetImpl.fromJsObject(jsObject);

/// Safely retrieves or creates an instance of [CssStyleSheetImpl] from the
/// [object].
CssStyleSheetImpl safeCssStyleSheetFromObject(Object object) =>
    safeJsWrapperFromObject<CssStyleSheetImpl>(object, _constructor);

/// Safely retrieves or creates an instance of [CssStyleSheetImpl] from the
/// [object] if it is not `null`.
CssStyleSheetImpl? safeCssStyleSheetFromObjectNullable(Object? object) =>
    safeJsWrapperFromObjectNullable<CssStyleSheetImpl>(object, _constructor);
