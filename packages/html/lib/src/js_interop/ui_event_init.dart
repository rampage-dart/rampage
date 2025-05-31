// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'event_init.dart';
import 'window.dart';

extension type UIEventInit._(JSObject _) implements JSObject, EventInit {
  external factory UIEventInit({
    bool bubbles,
    bool cancelable,
    bool composed,
    Window? view,
    int detail,
    int which,
  });

  external Window? get view;
  external set view(Window? value);
  external int get detail;
  external set detail(int value);
  external int get which;
  external set which(int value);
}
