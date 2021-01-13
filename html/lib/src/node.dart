// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'event_target.dart';

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
  T cloneNode<T extends Node>();
}
