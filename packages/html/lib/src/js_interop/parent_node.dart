// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'element.dart';
import 'html_collection.dart';
import 'node.dart';
import 'node_list.dart';

extension type ParentNode._(JSObject _) implements JSObject, Node {
  external HTMLCollection get children;
  external Element? get firstElementChild;
  external Element? get lastElementChild;
  external int get childElementCount;
  external void prepend(JSAny nodes);
  external void append(JSAny nodes);
  external void replaceChildren(JSAny nodes);
  external void moveBefore(Node node, Node? child);
  external Element? querySelector(String selectors);
  external NodeList querySelectorAll(String selectors);
}
