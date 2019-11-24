// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_browser_interop/browser_interop.dart' as interop;
import 'package:rampage_html/html.dart';

import 'element.dart';
import 'events.dart';

//-----------------------------------------------------------
// Node
//-----------------------------------------------------------

/// Browser implementation of [Node].
class NodeImpl<T extends interop.Node> extends EventTargetImpl<T>
    implements Node {
  /// Create an instance of [NodeImpl] from the [jsObject].
  NodeImpl.fromJsObject(T jsObject) : super.fromJsObject(jsObject);

  @override
  bool get isConnected => jsObject.isConnected;
}

//-----------------------------------------------------------
// ParentNode
//-----------------------------------------------------------

/// Browser implementation of [ParentNode].
mixin ParentNodeImpl<T extends interop.ParentNode> on NodeImpl<T>
    implements ParentNode {
  @override
  void append(Node node) {
    jsObject.append((node as NodeImpl).jsObject);
  }

  @override
  void prepend(Node node) {
    jsObject.prepend((node as NodeImpl).jsObject);
  }

  @override
  T querySelector<T extends Element>(String selectors) {
    final result = jsObject.querySelector(selectors);

    return result != null ? safeElementFromJsObject<T>(result) : null;
  }

  @override
  Iterable<T> querySelectorAll<T extends Element>(String selectors) sync* {
    final result = jsObject.querySelectorAll(selectors);
    final count = result.length;

    for (var i = 0; i < count; ++i) {
      yield safeElementFromJsObject<T>(result.item(i) as interop.Element);
    }
  }
}

//-----------------------------------------------------------
// ChildNode
//-----------------------------------------------------------

/// Browser implementation of [ChildNode].
mixin ChildNodeImpl<T extends interop.ChildNode> on NodeImpl<T>
    implements ChildNode {
  @override
  void remove() {
    jsObject.remove();
  }

  @override
  void before(Node node) {
    jsObject.before((node as NodeImpl).jsObject);
  }

  @override
  void after(Node node) {
    jsObject.after((node as NodeImpl).jsObject);
  }

  @override
  void replaceWith(Node node) {
    jsObject.replaceWith((node as NodeImpl).jsObject);
  }
}

//-----------------------------------------------------------
// Slotable
//-----------------------------------------------------------

/// Browser implementation of [Slotable].
mixin SlotableImpl<T extends interop.Slotable> on NodeImpl<T>
    implements Slotable {
  @override
  SlotElement get assignedSlot {
    final assignedTo = jsObject.assignedSlot;

    return assignedSlot != null
        ? SlotElementImpl.safeFromJsObject(assignedTo)
        : null;
  }
}
