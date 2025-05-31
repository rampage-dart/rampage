// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'event_target.dart';
import 'ui_event_init.dart';
import 'window.dart';

extension type FocusEventInit._(JSObject _) implements JSObject, UIEventInit {
  external factory FocusEventInit({
    bool bubbles,
    bool cancelable,
    bool composed,
    Window? view,
    int detail,
    int which,
    EventTarget? relatedTarget,
  });

  external EventTarget? get relatedTarget;
  external set relatedTarget(EventTarget? value);
}
