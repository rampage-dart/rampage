// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_browser_interop/browser_interop.dart' as interop;
import 'package:rampage_html/html.dart';

import 'style_sheet.dart';

/// Browser implementation of [CssStyleSheet].
class CssStyleSheetImpl extends StyleSheetImpl<interop.CssStyleSheet>
    implements CssStyleSheet {
  /// Create an instance of [CssStyleSheetImpl].
  factory CssStyleSheetImpl({
    String media = '',
    String title = '',
    bool alternate = false,
    bool disabled = false,
  }) =>
      CssStyleSheetImpl.fromJsObject(interop.CssStyleSheet(
        interop.CssStyleSheetInit(
          media: media,
          title: title,
          alternate: alternate,
          disabled: disabled,
        ),
      ));

  /// Create an instance of [CssStyleSheetImpl] from the [jsObject].
  CssStyleSheetImpl.fromJsObject(interop.CssStyleSheet jsObject)
      : super.fromJsObject(jsObject);

  /// Create an instance of [CssStyleSheetImpl] from the [jsObject].
  ///
  /// This constructor should be used when its unclear if the [jsObject] has
  /// already been wrapped.
  factory CssStyleSheetImpl.safeFromJsObject(interop.CssStyleSheet jsObject) =>
      jsObject.dartObject as CssStyleSheetImpl ??
      CssStyleSheetImpl.fromJsObject(jsObject);

  @override
  void replaceSync(String text) {
    jsObject.replaceSync(text);
  }
}
