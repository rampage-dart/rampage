// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'mouse_event.dart';
import 'wheel_event_init.dart';

extension type WheelEvent._(JSObject _) implements JSObject, MouseEvent {
  external factory WheelEvent(String type, [WheelEventInit eventInitDict]);

  external double get deltaX;
  external double get deltaY;
  external double get deltaZ;
  external int get deltaMode;
}
