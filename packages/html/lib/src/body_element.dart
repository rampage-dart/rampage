// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:meta/meta.dart';

import 'element_tag.dart' as tag;
import 'html_element.dart';
import 'js_interop/body_element.dart' as js;
import 'js_interop/document.dart' as js;

final class BodyElement extends HtmlElement<js.HTMLBodyElement> {
  factory BodyElement() => BodyElement.fromJsObject(
    js.document.createElement(tag.body) as js.HTMLBodyElement,
  );

  @protected
  BodyElement.fromJsObject(super.jsObject) : super.fromJsObject();
}
