// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'element.dart';
import 'event_target.dart';

extension type Node._(JSObject _) implements JSObject, EventTarget {
  external int get nodeType;
  external bool get isConnected;
  external Node? get parentNode;
  external Element? get parentElement;
  external Node? get firstChild;
  external Node? get lastChild;
  external Node? get previousSibling;
  external Node? get nextSibling;
  external Node cloneNode([bool subtree]);
}
