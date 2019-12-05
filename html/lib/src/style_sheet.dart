// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_html/browser/html.dart' as impl;

//-----------------------------------------------------------
// StyleSheet
//-----------------------------------------------------------

/// An object implementing the [StyleSheet] interface represents a single style
/// sheet.
///
/// CSS style sheets will further implement the more specialized [CssStyleSheet]
/// interface.
abstract class StyleSheet {
  /// Whether the current stylesheet has been applied or not.
  bool get disabled;

  /// The advisory title of the current style sheet.
  String get title;
}

//-----------------------------------------------------------
// CssStyleSheet
//-----------------------------------------------------------

/// The [CssStyleSheet] interface represents a single CSS stylesheet, and lets
/// you inspect and modify the list of rules contained in the stylesheet.
abstract class CssStyleSheet implements StyleSheet {
  /// Creates a new [CssStyleSheet].
  factory CssStyleSheet({
    String media,
    String title,
    bool alternate,
    bool disabled,
  }) = impl.CssStyleSheetImpl;

  /// Replace the contents of the style sheet with the [text].
  void replaceSync(String text);
}
