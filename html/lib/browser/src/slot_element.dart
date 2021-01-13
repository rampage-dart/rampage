// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'element_factory.dart';
import 'element_tag.dart';
import 'html_element.dart';
import 'wrapper.dart';

/// Browser implementation of [SlotElement].
class SlotElementImpl extends HtmlElementImpl implements SlotElement {
  /// Create an instance of [SlotElementImpl].
  factory SlotElementImpl() =>
      SlotElementImpl.fromJsObject(createElementJsObject(ElementTag.slot));

  /// Create an instance of [SlotElementImpl] from the [jsObject].
  SlotElementImpl.fromJsObject(JsObject jsObject)
      : super.fromJsObject(jsObject);

  /// Create an instance of [SlotElementImpl] from the [jsObject].
  ///
  /// This constructor should be used when its unclear if the [jsObject] has
  /// already been wrapped.
  factory SlotElementImpl.safeFromJsObject(JsObject jsObject) =>
      (jsObject.dartObject ?? SlotElementImpl.fromJsObject(jsObject))
          as SlotElementImpl;

  @override
  String get name => throw UnimplementedError('name not implemented');
  @override
  set name(String value) => throw UnimplementedError('name not implemented');

  @override
  Iterable<Element> assignedElements({bool flatten = false}) =>
      throw UnimplementedError('assignedElements not implemented');
}
