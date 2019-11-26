// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'element.dart';
import 'events.dart';

//-----------------------------------------------------------
// Node
//-----------------------------------------------------------

/// [Node] is an interface from which a number of DOM API object types inherit.
///
/// It allows those types to be treated similarly; for example, inheriting the
/// same set of methods, or being tested in the same way.
abstract class Node implements EventTarget {
  /// A boolean indicating whether or not the [Node] is connected (directly or
  /// indirectly) to the context object, e.g. the [Document] object in the case
  /// of the normal DOM, or the [ShadowRoot] in the case of a shadow DOM.
  bool get isConnected;

  /// Returns a duplicate of the node on which this method was called.
  U cloneNode<U extends Node>();
}

//-----------------------------------------------------------
// ParentNode
//-----------------------------------------------------------

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

//-----------------------------------------------------------
// ChildNode
//-----------------------------------------------------------

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

//-----------------------------------------------------------
// Slotable
//-----------------------------------------------------------

/// The [Slotable] interface defines features that allow nodes to become the
/// contents of a `<slot>` element - the following features are included in both
/// [Element] and [Text].
abstract class Slotable implements Node {
  /// Returns the `<slot>` the [Node] is inserted in.
  SlotElement get assignedSlot;
}
