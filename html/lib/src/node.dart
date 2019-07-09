// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'element.dart';

//-----------------------------------------------------------
// Node
//-----------------------------------------------------------

/// [Node] is an interface from which a number of DOM API object types inherit.
///
/// It allows those types to be treated similarly; for example, inheriting the
/// same set of methods, or being tested in the same way.
abstract class Node {
  /// A boolean indicating whether or not the [Node] is connected (directly or
  /// indirectly) to the context object, e.g. the [Document] object in the case
  /// of the normal DOM, or the [ShadowRoot] in the case of a shadow DOM.
  external bool get isConnected;
}

//-----------------------------------------------------------
// ParentNode
//-----------------------------------------------------------

/// The [ParentNode] mixin contains methods and properties that are common to
/// all types of [Node] objects that can have children.
abstract class ParentNode implements Node {
  /// Returns the first [Element] with the current element as root that matches
  /// the specified group of [selectors].
  T querySelector<T extends Element>(String selectors);

  /// Returns the [Element]s with current element as root that match the
  /// specified group of [selectors].
  Iterable<T> querySelectorAll<T extends Element>(String selectors);
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
