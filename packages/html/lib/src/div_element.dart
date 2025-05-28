// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:meta/meta.dart';

import 'element_tag.dart' as tag;
import 'html_element.dart';
import 'js_interop/div_element.dart' as js;
import 'js_interop/document.dart' as js;

final class DivElement extends HtmlElement<js.HTMLDivElement> {
  factory DivElement() => DivElement.fromJsObject(
    js.document.createElement(tag.div) as js.HTMLDivElement,
  );

  @protected
  DivElement.fromJsObject(super.jsObject) : super.fromJsObject();
}
