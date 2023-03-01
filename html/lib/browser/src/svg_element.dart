// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/svg.dart';

import 'element.dart';
import 'global_event_handlers.dart';
import 'html_or_svg_element.dart';

/// Browser implementation of [SvgElement].
class SvgElementImpl extends ElementImpl
    with HtmlOrSvgElementImpl, GlobalEventHandlersImpl
    implements SvgElement {
  /// Creates an instance of [SvgElementImpl] from the [jsObject].
  SvgElementImpl.fromJsObject(super.jsObject) : super.fromJsObject();
}
