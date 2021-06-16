// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'js/child_node.dart';
import 'node.dart';
import 'wrapper.dart';

/// Browser implementation of [ChildNode].
mixin ChildNodeImpl on NodeImpl implements ChildNode {
  @override
  void remove() {
    jsObject.remove();
  }

  @override
  void before(Node node) {
    jsObject.before(<JsObject>[toJsObject(node)]);
  }

  @override
  void after(Node node) {
    jsObject.after(<JsObject>[toJsObject(node)]);
  }

  @override
  void replaceWith(Node node) {
    jsObject.replaceWith(<JsObject>[toJsObject(node)]);
  }
}
