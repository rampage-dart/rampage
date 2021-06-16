// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'element_factory.dart';
import 'element_tag.dart';
import 'html_element.dart';
import 'js/style_element.dart';

/// Browser implementation of [StyleElement].
class StyleElementImpl extends HtmlElementImpl implements StyleElement {
  /// Create an instance of [StyleElementImpl].
  factory StyleElementImpl() =>
      StyleElementImpl.fromJsObject(createElementJsObject(ElementTag.style));

  /// Create an instance of [StyleElementImpl] from the [jsObject]
  StyleElementImpl.fromJsObject(JsObject jsObject)
      : super.fromJsObject(jsObject);

  @override
  String get media => jsObject.media;
  @override
  set media(String value) {
    jsObject.media = value;
  }
}
