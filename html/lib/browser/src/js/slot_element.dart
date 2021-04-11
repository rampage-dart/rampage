// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:js';

extension SlotElementJsObject on JsObject {
  bool get isInstanceOf => instanceof(context['HTMLSlotElement'] as JsFunction);

  String get name => this['name'] as String;
  set name(String value) {
    this['name'] = value;
  }
}
