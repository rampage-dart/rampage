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
  factory CssStyleSheetImpl([CssStyleSheetInit options]) =>
      CssStyleSheetImpl.fromJsObject(interop.CssStyleSheet(
        (options as CssStyleSheetInitImpl)?.jsObject ??
            interop.CssStyleSheetInit(),
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

/// Represents options that represent characteristics of a [CssStyleSheet].
class CssStyleSheetInitImpl implements CssStyleSheetInit {
  /// Creates the [CssStyleSheetInit] options.
  factory CssStyleSheetInitImpl({
    String media = '',
    String title = '',
    bool alternate = false,
    bool disabled = false,
  }) =>
      CssStyleSheetInitImpl.fromJsObject(interop.CssStyleSheetInit(
        media: media,
        title: title,
        alternate: alternate,
        disabled: disabled,
      ));

  /// Creates a [CssStyleSheetInitImpl] from the [jsObject].
  CssStyleSheetInitImpl.fromJsObject(this.jsObject);

  /// The JavaScript object being wrapped.
  final interop.CssStyleSheetInit jsObject;

  @override
  String get media => jsObject.media;
  @override
  set media(String value) {
    jsObject.media = value;
  }

  @override
  String get title => jsObject.title;
  @override
  set title(String value) {
    jsObject.title = value;
  }

  @override
  bool get alternate => jsObject.alternate;
  @override
  set alternate(bool value) {
    jsObject.alternate = value;
  }

  @override
  bool get disabled => jsObject.disabled;
  @override
  set disabled(bool value) {
    jsObject.disabled = value;
  }
}
