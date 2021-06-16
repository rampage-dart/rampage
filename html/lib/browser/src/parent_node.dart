// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'collection.dart';
import 'element_from_js_object.dart';
import 'js/parent_node.dart';
import 'node.dart';

/// Browser implementation of [ParentNode].
mixin ParentNodeImpl on NodeImpl implements ParentNode {
  @override
  late final List<Element> children = Collection<Element>.fromJsObject(
    JsObject.fromBrowserObject(jsObject.children),
  );

  @override
  Element? get firstElementChild =>
      safeElementFromObjectNullable(jsObject.firstElementChild);

  @override
  Element? get lastElementChild =>
      safeElementFromObjectNullable(jsObject.lastElementChild);

  @override
  void append(Node node) {
    jsObject.append(<JsObject>[(node as NodeImpl).jsObject]);
  }

  @override
  void prepend(Node node) {
    jsObject.prepend(<JsObject>[(node as NodeImpl).jsObject]);
  }

  @override
  void replaceChildren(Node node) {
    jsObject.replaceChildren(<JsObject>[(node as NodeImpl).jsObject]);
  }

  @override
  T? querySelector<T extends Element>(String selectors) =>
      safeElementFromObjectNullable(jsObject.querySelector(selectors)) as T?;

  @override
  Iterable<T> querySelectorAll<T extends Element>(String selectors) =>
      throw UnimplementedError('querySelectorAll not implemented');
}
