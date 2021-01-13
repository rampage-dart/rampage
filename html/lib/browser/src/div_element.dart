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

/// Browser implementation of [DivElement].
class DivElementImpl extends HtmlElementImpl implements DivElement {
  /// Create an instance of [DivElementImpl].
  factory DivElementImpl() =>
      DivElementImpl.fromJsObject(createElementJsObject(ElementTag.div));

  /// Create an instance of [DivElementImpl] from the [jsObject]
  DivElementImpl.fromJsObject(JsObject jsObject) : super.fromJsObject(jsObject);

  /// Create an instance of [DivElementImpl] from the [jsObject].
  ///
  /// This constructor should be used when its unclear if the [jsObject] has
  /// already been wrapped.
  factory DivElementImpl.safeFromJsObject(JsObject jsObject) =>
      (jsObject.dartObject ?? DivElementImpl.fromJsObject(jsObject))
          as DivElementImpl;
}
