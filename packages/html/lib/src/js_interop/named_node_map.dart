// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'attr.dart';

extension type NamedNodeMap._(JSObject _) implements JSObject {
  external int get length;
  external Attr? item(int index);
  external Attr? getNamedItem(String qualifiedName);
  external Attr? getNamedItemNS(String? namespace, String localName);
  external Attr? setNamedItem(Attr attr);
  external Attr? setNamedItemNS(Attr attr);
  external Attr removeNamedItem(String qualifiedName);
  external Attr removeNamedItemNS(String? namespace, String localName);
}
