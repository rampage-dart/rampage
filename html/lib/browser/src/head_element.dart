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

/// Browser implementation of [HeadElement].
class HeadElementImpl extends HtmlElementImpl implements HeadElement {
  /// Create an instance of [HeadElementImpl].
  factory HeadElementImpl() =>
      HeadElementImpl.fromJsObject(createElementJsObject(ElementTag.head));

  /// Create an instance of [HeadElementImpl] from the [jsObject]
  HeadElementImpl.fromJsObject(JsObject jsObject)
      : super.fromJsObject(jsObject);

  /// Create an instance of [HeadElementImpl] from the [jsObject].
  ///
  /// This constructor should be used when its unclear if the [jsObject] has
  /// already been wrapped.
  factory HeadElementImpl.safeFromJsObject(JsObject jsObject) =>
      (jsObject.dartObject ?? HeadElementImpl.fromJsObject(jsObject))
          as HeadElementImpl;
}
