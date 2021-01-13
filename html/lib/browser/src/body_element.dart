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

/// Browser implementation of [BodyElement].
class BodyElementImpl extends HtmlElementImpl implements BodyElement {
  /// Create an instance of [BodyElementImpl].
  factory BodyElementImpl() =>
      BodyElementImpl.fromJsObject(createElementJsObject(ElementTag.body));

  /// Create an instance of [BodyElementImpl] from the [jsObject]
  BodyElementImpl.fromJsObject(JsObject jsObject)
      : super.fromJsObject(jsObject);

  /// Create an instance of [BodyElementImpl] from the [jsObject].
  ///
  /// This constructor should be used when its unclear if the [jsObject] has
  /// already been wrapped.
  factory BodyElementImpl.safeFromJsObject(JsObject jsObject) =>
      (jsObject.dartObject ?? BodyElementImpl.fromJsObject(jsObject))
          as BodyElementImpl;
}
