// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_browser_interop/browser_interop.dart' as interop;
import 'package:rampage_html/html.dart';

import 'element.dart';
import 'event_target.dart';

/// Browser implementation of [Node].
class NodeImpl<T extends interop.Node> extends EventTargetImpl<T>
    implements Node {
  /// Create an instance of [NodeImpl] from the [jsObject].
  NodeImpl.fromJsObject(T jsObject) : super.fromJsObject(jsObject);

  @override
  bool get isConnected => jsObject.isConnected;

  @override
  U cloneNode<U extends Node>() =>
      nodeFromJsObject<U>(jsObject.cloneNode(true));
}

/// Creates an instance of [T] from the [jsObject].
T nodeFromJsObject<T extends Node>(interop.Node jsObject) {
  if (jsObject is interop.Element) {
    return elementFromJsObject(jsObject) as T;
  }

  assert(false, 'Unknown node');
  return null;
}
