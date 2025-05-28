// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'js_interop/child_node.dart' as js;

import 'node.dart';

abstract mixin class ChildNode<T extends js.ChildNode> implements Node<T> {
  void remove() {
    jsObject.remove();
  }
}
