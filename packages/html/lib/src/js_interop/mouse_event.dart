// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'event_target.dart';
import 'mouse_event_init.dart';
import 'ui_event.dart';

extension type MouseEvent._(JSObject _) implements JSObject, UIEvent {
  external factory MouseEvent(String type, [MouseEventInit eventInitDict]);

  external int get screenX;
  external int get screenY;
  external int get clientX;
  external int get clientY;
  external int get layerX;
  external int get layerY;
  external bool get ctrlKey;
  external bool get shiftKey;
  external bool get altKey;
  external bool get metaKey;
  external int get button;
  external int get buttons;
  external EventTarget? get relatedTarget;
  external bool getModifierState(String keyArg);
}
