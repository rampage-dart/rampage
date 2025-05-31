// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:meta/meta.dart';

import 'element_tag.dart' as tag;
import 'html_element.dart';
import 'js_interop/document.dart' as js;
import 'js_interop/head_element.dart' as js;
import 'wrapper.dart';

final class HeadElement extends HtmlElement<js.HTMLHeadElement> {
  factory HeadElement() => HeadElement.fromJsObject(
    js.document.createElement(tag.head) as js.HTMLHeadElement,
  );

  @protected
  HeadElement.fromJsObject(super.jsObject) : super.fromJsObject();
}

@internal
HeadElement safeHeadElementFromJsObject(js.HTMLHeadElement jsObject) =>
    safeJsWrapperFromJsObject<js.HTMLHeadElement>(
          jsObject,
          HeadElement.fromJsObject,
        )
        as HeadElement;

@internal
HeadElement? safeHeadElementFromJsObjectNullable(js.HTMLHeadElement? object) =>
    safeJsWrapperFromJsObjectNullable<js.HTMLHeadElement>(
          object,
          HeadElement.fromJsObject,
        )
        as HeadElement;
