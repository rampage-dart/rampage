// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'event.dart';
import 'ui_event_init.dart';
import 'window.dart';

extension type UIEvent._(JSObject _) implements JSObject, Event {
  external factory UIEvent(String type, [UIEventInit eventInitDict]);

  external Window? get view;
  external int get detail;
  external int get which;
}
