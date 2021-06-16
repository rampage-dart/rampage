// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:collection';
import 'dart:js';

import 'package:rampage_html/html.dart';

import 'element_from_js_object.dart';
import 'js/collection.dart';
import 'wrapper.dart';

///
class Collection<T extends Node> extends JsWrapper with ListMixin<T> {
  Collection.fromJsObject(JsObject jsObject) : super.fromJsObject(jsObject);

  @override
  int get length => jsObject.length;

  @override
  T operator [](int index) =>
      safeElementFromObject(JsObject.fromBrowserObject(jsObject.item(index)!))
          as T;

  @override
  void operator []=(int index, T value) {
    // TODO: implement []=
  }

  @override
  set length(int newLength) {
    // TODO: implement length
  }
}
