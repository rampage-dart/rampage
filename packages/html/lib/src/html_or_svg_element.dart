// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'element.dart';
import 'js_interop/html_or_svg_element.dart' as js;

abstract mixin class HtmlOrSvgElement<T extends js.HTMLOrSVGElement>
    implements Element<T> {
  void focus() {
    jsObject.focus();
  }

  void blur() {
    jsObject.blur();
  }
}
