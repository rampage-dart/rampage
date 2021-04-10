// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:js';

import 'event_init.dart';

extension UIEventInitJsObject on JsObject {
  static JsObject construct({
    required bool bubbles,
    required bool cancelable,
    required bool composed,
    required JsObject? /* Window */ view,
    required int detail,
    Map<String, Object?> extend = const <String, Object?>{},
  }) =>
      EventInitJsObject.construct(
        bubbles: bubbles,
        cancelable: cancelable,
        composed: composed,
        extend: <String, Object?>{
          'view': view,
          'detail': detail,
          ...extend,
        },
      );
}
