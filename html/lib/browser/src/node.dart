// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'element_from_js_object.dart';
import 'event_target.dart';
import 'js/node.dart';
import 'node_from_js_object.dart';

/// Browser implementation of [Node].
class NodeImpl extends EventTargetImpl implements Node {
  /// Create an instance of [NodeImpl] from the [jsObject].
  NodeImpl.fromJsObject(super.jsObject) : super.fromJsObject();

  @override
  bool get isConnected => jsObject.isConnected;

  @override
  Node? get parentNode => safeNodeFromObjectNullable(jsObject.parentNode);

  @override
  Element? get parent => safeElementFromObjectNullable(jsObject.parent);

  @override
  Node? get firstChild => safeNodeFromObjectNullable(jsObject.firstChild);

  @override
  Node? get lastChild => safeNodeFromObjectNullable(jsObject.lastChild);

  @override
  Node? get previousSibling =>
      safeNodeFromObjectNullable(jsObject.previousSibling);

  @override
  Node? get nextSibling => safeNodeFromObjectNullable(jsObject.nextSibling);

  @override
  T cloneNode<T extends Node>() =>
      safeNodeFromObject(jsObject.cloneNode(true)) as T;
}
