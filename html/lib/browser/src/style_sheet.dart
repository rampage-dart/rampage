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
}
