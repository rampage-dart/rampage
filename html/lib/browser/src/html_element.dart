// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'element.dart';
import 'global_event_handlers.dart';
import 'html_or_svg_element.dart';

/// Browser implementation of [HtmlElement].
class HtmlElementImpl extends ElementImpl
    with HtmlOrSvgElementImpl, GlobalEventHandlersImpl
    implements HtmlElement {
  /// Creates an instance of [HtmlElementImpl] from the [jsObject].
  HtmlElementImpl.fromJsObject(JsObject jsObject)
      : super.fromJsObject(jsObject);

  @override
  String get innerText => throw UnimplementedError('innerText not implemented');
  @override
  set innerText(String value) =>
      throw UnimplementedError('innerText not implemented');
}
