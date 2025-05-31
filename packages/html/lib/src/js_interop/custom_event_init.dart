// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'event_init.dart';

extension type CustomEventInit._(JSObject _) implements JSObject, EventInit {
  external factory CustomEventInit({
    bool bubbles,
    bool cancelable,
    bool composed,
    JSAny? detail,
  });

  external JSAny? get detail;
  external set detail(JSAny? value);
}
