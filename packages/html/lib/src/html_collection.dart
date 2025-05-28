// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:collection';

import 'package:meta/meta.dart';

import 'element.dart';
import 'js_interop/html_collection.dart' as js;
import 'wrapper.dart';

@internal
class HtmlCollection extends JsWrapper<js.HTMLCollection>
    with ListBase<Element>
    implements List<Element> {
  @protected
  HtmlCollection.fromJsObject(super.jsObject) : super.fromJsObject();

  @override
  int get length => jsObject.length;

  @override
  Element operator [](int index) {
    final element = jsObject.item(index)!;

    return safeElementFromJsObject(element);
  }

  @override
  void operator []=(int index, Element value) {
    final element = jsObject.item(index)!;

    element.replaceWith(value.jsObject);
  }

  @override
  set length(int newLength) {
    throw UnsupportedError('cannot modify the length directly');
  }
}
