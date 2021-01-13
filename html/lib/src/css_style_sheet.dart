// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_html/browser/html.dart' as impl;

import 'style_sheet.dart';

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
