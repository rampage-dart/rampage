// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:js';

extension NamedNodeMapJsObject on JsObject {
  int get length => this['length'] as int;
  Object? item(int index) => callMethod('item', <Object?>[index]);
  Object? getNamedItem(String qualifiedName) =>
      callMethod('getNamedItem', <Object?>[qualifiedName]);
  Object? setNamedItem(JsObject attr) =>
      callMethod('setNamedItem', <Object?>[attr]);
  Object removeNamedItem(String qualifiedName) =>
      callMethod('removeNamedItem', <Object?>[qualifiedName]) as Object;
}
