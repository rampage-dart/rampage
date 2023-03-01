// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'element_factory.dart';
import 'element_tag.dart';
import 'html_element.dart';
import 'js/image_element.dart';

/// Browser implementation of [ImageElement].
class ImageElementImpl extends HtmlElementImpl implements ImageElement {
  /// Create an instance of [ImageElementImpl].
  factory ImageElementImpl() =>
      ImageElementImpl.fromJsObject(createElementJsObject(ElementTag.image));

  /// Create an instance of [ImageElementImpl] from the [jsObject].
  ImageElementImpl.fromJsObject(super.jsObject) : super.fromJsObject();

  @override
  String get src => jsObject.src;
  @override
  set src(String value) {
    jsObject.src = value;
  }

  @override
  int get width => jsObject.width;
  @override
  set width(int value) {
    jsObject.width = value;
  }

  @override
  int get height => jsObject.height;
  @override
  set height(int value) {
    jsObject.height = value;
  }

  @override
  int get naturalWidth => jsObject.naturalWidth;

  @override
  int get naturalHeight => jsObject.naturalHeight;

  @override
  Future<void> decode() => jsObject.decode();
}
