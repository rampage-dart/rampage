// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'event.dart';
import 'event_listener.dart';

extension type EventTarget._(JSObject _) implements JSObject {
  external factory EventTarget();

  external void addEventListener(
    String type,
    EventListener? callback, [
    JSAny options,
  ]);
  external void removeEventListener(
    String type,
    EventListener? callback, [
    JSAny options,
  ]);
  external bool dispatchEvent(Event event);
}
