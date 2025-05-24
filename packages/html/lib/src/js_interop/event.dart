// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'dom_high_res_time_stamp.dart';
import 'event_target.dart';

extension type Event._(JSObject _) implements JSObject {
  external String get type;
  external EventTarget? get target;
  external EventTarget? get currentTarget;
  external int get eventPhase;
  external bool get bubbles;
  external bool get cancelable;
  external bool get defaultPrevented;
  external bool get composed;
  external DomHighResTimeStamp get timeStamp;
  external void stopPropagation();
  external void stopImmediatePropagation();
  external void preventDefault();
}
