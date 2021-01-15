// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'element.dart';
import 'html_or_svg_element.dart';

/// The [HtmlElement] interface represents any HTML element.
abstract class HtmlElement implements Element, HtmlOrSvgElement {
  /// Represents the "rendered" text content of a node and its descendants. As a
  /// getter, it approximates the text the user would get if they highlighted
  /// the contents of the element with the cursor and then copied it to the
  /// clipboard.
  String get innerText;
  set innerText(String value);
}
