// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

@JS()
library rampage_browser_interop.src.parent_node;

import 'package:js/js.dart';

import 'element.dart';
import 'node.dart';
import 'node_list.dart';

/// The [ParentNode] mixin contains methods and properties that are common to
/// all types of [Node] objects that can have children.
@JS()
mixin ParentNode on Node {
  /// Returns the number of children of this [ParentNode] which are [Element]s.
  external int get childElementCount;

  /// Returns the first [Node] which is both a child of this [ParentNode] and is
  /// is also an [Element], or `null` if there is none.
  external Element get firstElementChild;

  /// Returns the last [Node] which is both a child of this [ParentNode] and is
  /// also an [Element], or `null` if there is none.
  external Element get lastElementChild;

  /// Inserts a set of [Node]s after the last child of the [ParentNode].
  external void append(
    Node node0, [
    Node node1,
    Node node2,
    Node node3,
    Node node4,
    Node node5,
    Node node6,
    Node node7,
    Node node8,
    Node node9,
  ]);

  /// Inserts a set of [Node]s before the first child of the [ParentNode].
  external void prepend(
    Node node0, [
    Node node1,
    Node node2,
    Node node3,
    Node node4,
    Node node5,
    Node node6,
    Node node7,
    Node node8,
    Node node9,
  ]);

  /// Returns the first [Element] with the current element as root that matches
  /// the specified group of [selectors].
  external Element querySelector(String selectors);

  /// Returns a [NodeList] representing a list of elements with the current
  /// element as root that matches the specified group of [selectors].
  external NodeList querySelectorAll(String selectors);
}
