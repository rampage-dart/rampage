// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:js';

import 'event_listener_options.dart';

extension AddEventListenerOptionsJsObject on JsObject {
  static JsObject construct({
    required bool capture,
    required bool passive,
    required bool once
  }) =>
      EventListenerOptionsJsObject.construct(
        capture: capture,
        extend: <String, Object?>{
          'capture': capture,
          'passive': passive,
          'once': once,
        },
      );
}
