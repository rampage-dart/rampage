// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'body_element.dart';
import 'div_element.dart';
import 'element_tag.dart';
import 'head_element.dart';
import 'html_element.dart';
import 'image_element.dart';
import 'script_element.dart';
import 'slot_element.dart';
import 'template_element.dart';
import 'wrapper.dart';

HtmlElementImpl htmlElementFromJsObject(JsObject jsObject) {
  assert(jsObject.dartObject == null, 'the jsObject should not be wrapped');

  final tag = jsObject.tagName;
  switch (tag) {
    case ElementTag.div:
      return DivElementImpl.fromJsObject(jsObject);
    case ElementTag.image:
      return ImageElementImpl.fromJsObject(jsObject);
    case ElementTag.slot:
      return SlotElementImpl.fromJsObject(jsObject);
    case ElementTag.template:
      return TemplateElementImpl.fromJsObject(jsObject);
    case ElementTag.body:
      return BodyElementImpl.fromJsObject(jsObject);
    case ElementTag.head:
      return HeadElementImpl.fromJsObject(jsObject);
    case ElementTag.script:
      return ScriptElementImpl.fromJsObject(jsObject);
  }

  throw UnsupportedError('Unsupported $tag element');
}

/// Safely retrieves or creates an instance of [HtmlElementImpl] from the
/// [object].
HtmlElementImpl safeHtmlElementFromObject(Object object) =>
    safeJsWrapperFromObject<HtmlElementImpl>(object, htmlElementFromJsObject);

/// Safely retrieves or creates an instance of [HtmlElementImpl] from the
/// [object] if it is not `null`.
HtmlElementImpl? safeHtmlElementFromObjectNullable(Object? object) =>
    safeJsWrapperFromObjectNullable(object, htmlElementFromJsObject);
