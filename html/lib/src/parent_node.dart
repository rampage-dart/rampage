// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'element.dart';
import 'node.dart';

/// The [ParentNode] mixin contains methods and properties that are common to
/// all types of [Node] objects that can have children.
abstract class ParentNode implements Node {
  /// All of the [Element] objects that are children of this [ParentNode],
  /// omitting all of its non-element nodes.
  List<Element> get children;

  /// The first [Node] which is both a child of this [ParentNode] and is also
  /// an [Element], or `null` if there is none.
  Element? get firstElementChild;

  /// The last [Node] which is both a child of this [ParentNode] and is also
  /// an [Element], or `null` if there is none.
  Element? get lastElementChild;

  /// Inserts the [node] after the last child of the [ParentNode].
  void append(Node node);

  /// Inserts the [node] before the first child of the [ParentNode].
  void prepend(Node node);

  /// Replaces the existing children of the [ParentNode] with the [node].
  void replaceChildren(Node node);

  /// Returns the first [Element] with the current element as root that matches
  /// the specified group of [selectors].
  T? querySelector<T extends Element>(String selectors);

  /// Returns the [Element]s with current element as root that match the
  /// specified group of [selectors].
  Iterable<T> querySelectorAll<T extends Element>(String selectors);
}
