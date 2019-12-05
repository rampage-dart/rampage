// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'node.dart';

/// The [ChildNode] mixin contains methods that are particular to [Node] objects
/// that can have a parent.
abstract class ChildNode implements Node {
  /// Removes this [ChildNode] from the children list of its parent.
  void remove();

  // TODO(): The following methods are vargs in the browser

  /// Inserts a [Node] in the children list of this [ChildNode]'s parent, just
  /// before this [ChildNode].
  void before(Node node);

  /// Inserts a [Node] in the children list of this [ChildNode]'s parent, just
  /// after this [ChildNode].
  void after(Node node);

  /// Replaces this [ChildNode] in the children list of its parent with a
  /// [Node].
  void replaceWith(Node node);
}
