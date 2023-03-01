// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'element_factory.dart';
import 'element_tag.dart';
import 'svg_element.dart';

/// Browser implementation of [BodyElement].
class SvgSvgElementImpl extends SvgElementImpl {
  /// Create an instance of [BodyElementImpl].
  factory SvgSvgElementImpl() =>
      SvgSvgElementImpl.fromJsObject(createSvgElementJsObject(ElementTag.svg));

  /// Create an instance of [BodyElementImpl] from the [jsObject]
  SvgSvgElementImpl.fromJsObject(super.jsObject) : super.fromJsObject();
}
