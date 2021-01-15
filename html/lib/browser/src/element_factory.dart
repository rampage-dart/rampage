// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'body_element.dart';
import 'div_element.dart';
import 'element_tag.dart';
import 'image_element.dart';
import 'script_element.dart';
import 'slot_element.dart';
import 'template_element.dart';
import 'wrapper.dart';

/// Creates an [Element] from the given [tagName].
Element createElement(String tag) =>
    elementFromJsObject(createElementJsObject(tag));

/// Calls `document.createElement` to create a [JsObject] that represents a
/// `HTMLElement`.
JsObject createElementJsObject(String tag) {
  final document = JsObject.fromBrowserObject(context['document'] as Object);
  final jsElement =
      document.callMethod('createElement', <String>[tag]) as Object;

  return JsObject.fromBrowserObject(jsElement);
}

/// Creates an instance of [T] from the [jsObject].
///
/// Uses the [interop.Element.tagName] to determine the [Element] to construct.
T elementFromJsObject<T extends Element>(JsObject jsObject) {
  final tag = jsObject.tagName;
  switch (tag) {
    case ElementTag.div:
      return DivElementImpl.fromJsObject(jsObject) as T;
    case ElementTag.image:
      return ImageElementImpl.fromJsObject(jsObject) as T;
    case ElementTag.slot:
      return SlotElementImpl.fromJsObject(jsObject) as T;
    case ElementTag.template:
      return TemplateElementImpl.fromJsObject(jsObject) as T;
    case ElementTag.body:
      return BodyElementImpl.fromJsObject(jsObject) as T;
    case ElementTag.script:
      return ScriptElementImpl.fromJsObject(jsObject) as T;
  }

  throw UnsupportedError('$tag not supported');
}

/// Creates an instance of [T] from the [jsObject].
///
/// This function should be used when its unclear if the [jsObject] has already
/// has already been wrapped.
T safeElementFromJsObject<T extends Element>(JsObject jsObject) =>
    (jsObject.dartObject ?? elementFromJsObject<T>(jsObject)) as T;
