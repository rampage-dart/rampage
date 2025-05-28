// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'package:meta/meta.dart';

import 'html_element.dart';
import 'js_interop/image_element.dart' as js;

final class ImageElement extends HtmlElement<js.HTMLImageElement> {
  @protected
  ImageElement.fromJsObject(super.jsObject) : super.fromJsObject();

  String get src => jsObject.src;

  set src(String value) {
    jsObject.src = value;
  }

  int get width => jsObject.width;

  set width(int value) {
    jsObject.width = value;
  }

  int get height => jsObject.height;

  set height(int value) {
    jsObject.height = value;
  }

  int get naturalWidth => jsObject.naturalWidth;

  int get naturalHeight => jsObject.naturalHeight;

  Future<void> decode() => jsObject.decode().toDart;
}
