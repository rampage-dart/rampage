// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_browser_interop/browser_interop.dart' as interop;
import 'package:rampage_html/html.dart';

import 'js_wrapper.dart';

//-----------------------------------------------------------
// StyleSheet
//-----------------------------------------------------------

/// Browser implementation of [StyleSheet].
class StyleSheetImpl<T extends interop.StyleSheet> extends JsWrapper<T>
    implements StyleSheet {
  /// Create an instance of [StyleSheetImpl] from the [jsObject].
  StyleSheetImpl.fromJsObject(T jsObject) : super.fromJsObject(jsObject);

  @override
  bool get disabled => jsObject.disabled;

  @override
  String get title => jsObject.title;
}

//-----------------------------------------------------------
// CssStyleSheet
//-----------------------------------------------------------

/// Browser implementation of [CssStyleSheet].
class CssStyleSheetImpl extends StyleSheetImpl<interop.CssStyleSheet>
    implements CssStyleSheet {
  /// Create an instance of [CssStyleSheetImpl].
  factory CssStyleSheetImpl() =>
      CssStyleSheetImpl.fromJsObject(interop.CssStyleSheet());

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
