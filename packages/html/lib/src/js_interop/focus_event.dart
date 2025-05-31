// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'event_target.dart';
import 'focus_event_init.dart';
import 'ui_event.dart';

extension type FocusEvent._(JSObject _) implements JSObject, UIEvent {
  external factory FocusEvent(String type, [FocusEventInit eventInitDict]);

  external EventTarget? get relatedTarget;
}
