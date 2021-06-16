// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_html/html.dart';

import 'element.dart';
import 'js/html_or_svg_element.dart';

/// Browser implementation of [HtmlOrSvgElement].
mixin HtmlOrSvgElementImpl on ElementImpl implements HtmlOrSvgElement {
  @override
  void focus({bool preventScroll = false}) => jsObject.focus(preventScroll);

  @override
  void blur() => jsObject.blur();
}
