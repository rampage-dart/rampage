// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:js';

extension EventInitJsObject on JsObject {
  static JsObject construct({
    required bool bubbles,
    required bool cancelable,
    required bool composed,
    Map<String, Object?> extend = const <String, Object?>{},
  }) =>
      JsObject.jsify(<String, Object?>{
        'bubbles': bubbles,
        'cancelable': cancelable,
        'composed': composed,
        ...extend,
      });
}
