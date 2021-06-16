// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'element_tag.dart';
import 'svg_element.dart';
import 'svg_svg_element.dart';

SvgElementImpl svgElementFromJsObject(JsObject jsObject) {
  final tag = jsObject.tagName;

  switch (tag.toUpperCase()) {
    case ElementTag.svg:
      return SvgSvgElementImpl.fromJsObject(jsObject);
  }

  throw UnsupportedError('Unsupported $tag element');
}
