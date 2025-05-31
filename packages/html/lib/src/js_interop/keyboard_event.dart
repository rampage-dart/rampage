// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'keyboard_event_init.dart';
import 'ui_event.dart';

extension type KeyboardEvent._(JSObject _) implements JSObject, UIEvent {
  external factory KeyboardEvent(
    String type, [
    KeyboardEventInit eventInitDict,
  ]);

  external String get key;
  external String get code;
  external int get location;
  external bool get ctrlKey;
  external bool get shiftKey;
  external bool get altKey;
  external bool get metaKey;
  external bool get repeat;
  external bool get isComposing;
  external int get charCode;
  external int get keyCode;
  external bool getModifierState(String keyArg);
}
