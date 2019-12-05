// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'element.dart';
import 'node.dart';

/// The [ParentNode] mixin contains methods and properties that are common to
/// all types of [Node] objects that can have children.
abstract class ParentNode implements Node {
  /// Inserts a [Node] after the last child of the [ParentNode].
  void append(Node node);

  /// Inserts a [Node] before the first child of the [ParentNode].
  void prepend(Node node);

  /// Returns the first [Element] with the current element as root that matches
  /// the specified group of [selectors].
  T querySelector<T extends Element>(String selectors);

  /// Returns the [Element]s with current element as root that match the
  /// specified group of [selectors].
  Iterable<T> querySelectorAll<T extends Element>(String selectors);
}
