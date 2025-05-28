// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'node.dart';
import 'non_element_parent_node.dart';
import 'parent_node.dart';

extension type DocumentFragment._(JSObject _)
    implements JSObject, Node, NonElementParentNode, ParentNode {
  external factory DocumentFragment();
}
