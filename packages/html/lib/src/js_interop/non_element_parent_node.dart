// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'element.dart';
import 'node.dart';

extension type NonElementParentNode._(JSObject _) implements JSObject, Node {
  external Element? getElementById(String elementId);
}
