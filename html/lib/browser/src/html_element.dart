// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_html/html.dart';

import 'element.dart';
import 'global_event_handlers.dart';
import 'html_or_svg_element.dart';
import 'js/html_element.dart';

/// Browser implementation of [HtmlElement].
class HtmlElementImpl extends ElementImpl
    with HtmlOrSvgElementImpl, GlobalEventHandlersImpl
    implements HtmlElement {
  /// Creates an instance of [HtmlElementImpl] from the [jsObject].
  HtmlElementImpl.fromJsObject(super.jsObject) : super.fromJsObject();

  @override
  String get innerText => jsObject.innerText;
  @override
  set innerText(String value) {
    jsObject.innerText = value;
  }
}
