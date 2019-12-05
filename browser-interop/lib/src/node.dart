// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

@JS()
library rampage_browser_interop.src.node;

import 'package:js/js.dart';

import 'element.dart';
import 'event_target.dart';
import 'node_list.dart';

/// [Node] is an interface from which a number of DOM API object types inherit.
///
/// It allows those types to be treated similarly; for example, inheriting the
/// same set of methods, or being tested in the same way.
@JS('Node')
class Node extends EventTarget {
  /// An integer that identifies what the node is.
  ///
  /// It distinguishes different kind of nodes from each other, such as
  /// elements, text and comments.
  external int get nodeType;

  /// A boolean indicating whether or not the [Node] is connected (directly or
  /// indirectly) to the context object, e.g. the [Document] object in the case
  /// of the normal DOM, or the [ShadowRoot] in the case of a shadow DOM.
  external bool get isConnected;

  /// The parent of the specified [Node] in the DOM tree.
  external Node get parentNode;

  /// The DOM [Node]'s parent [Element], or null if the node either has no
  /// parent, or its parent isn't a DOM [Element].
  external Element get parentElement;

  /// A live [NodeList] of child [Node]s of the given element where the first
  /// child [Node] is assigned index 0.
  external NodeList get childNodes;

  /// Clone a [Node], and optionally, all of its contents.
  external Node cloneNode(bool deep);
}
