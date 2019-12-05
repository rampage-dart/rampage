// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

@JS()
library rampage_browser_interop.src.css_style_sheet;

import 'package:js/js.dart';

import 'style_sheet.dart';

/// The [CssStyleSheet] interface represents a single CSS stylesheet, and lets
/// you inspect and modify the list of rules contained in the stylesheet.
@JS('CSSStyleSheet')
class CssStyleSheet extends StyleSheet {
  /// Creates a new [CssStyleSheet] from the [options].
  ///
  /// Constructor is an extension from the
  /// [Constructable Stylesheet Objects](https://wicg.github.io/construct-stylesheets)
  /// API.
  external factory CssStyleSheet([CssStyleSheetInit options]);

  /// Deletes the rule at the specified index into the stylesheet's rule list.
  external void deleteRule(int index);

  /// Inserts a new rule at the specified position in the stylesheet, given the
  /// textual representation of the rule.
  external void insertRule(String text, [int index]);

  /// Replace the contents of the style sheet with the [text].
  ///
  /// Method is an extension from the
  /// [Constructable Stylesheet Objects](https://wicg.github.io/construct-stylesheets)
  /// API.
  external void replaceSync(String text);
}

/// Represents options that represent characteristics of a [CssStyleSheet].
@JS()
@anonymous
class CssStyleSheetInit {
  /// Creates the [CssStyleSheetInit] options.
  external factory CssStyleSheetInit({
    String media = '',
    String title = '',
    bool alternate = false,
    bool disabled = false,
  });

  /// The intended destination medium for style information.
  external String get media;
  external set media(String value);

  /// The advisory title for the style sheet.
  external String get title;
  external set title(String value);

  /// Whether the style sheet is not the default.
  external bool get alternate;
  external set alternate(bool value);

  /// Whether the style sheet will be applied or not.
  external bool get disabled;
  external set disabled(bool value);
}
