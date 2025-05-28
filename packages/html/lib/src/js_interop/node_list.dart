// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'node.dart';

extension type NodeList._(JSObject _) implements JSObject {
  external int get length;
  external Node? item(int index);
}
