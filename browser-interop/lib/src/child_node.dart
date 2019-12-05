// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

@JS()
library rampage_browser_interop.src.child_node;

import 'package:js/js.dart';

import 'node.dart';

/// The [ChildNode] mixin contains methods that are particular to [Node] objects
/// that can have a parent.
@JS()
mixin ChildNode on Node {
  /// Removes this [ChildNode] from the children list of its parent.
  external void remove();

  /// Inserts a set of [Node]s in the children list of this [ChildNode]'s
  /// parent, just before this [ChildNode].
  external void before(
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

  /// Inserts a set of [Node]s in the children list of this [ChildNode]'s
  /// parent, just after this [ChildNode].
  external void after(
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

  /// Replaces this [ChildNode] in the children list of its parent with a set of
  /// [Node]s.
  external void replaceWith(
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
}
