// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'event_target.dart';
import 'mouse_event_init.dart';
import 'window.dart';

extension type WheelEventInit._(JSObject _)
    implements JSObject, MouseEventInit {
  external factory WheelEventInit({
    bool bubbles,
    bool cancelable,
    bool composed,
    Window? view,
    int detail,
    int which,
    bool ctrlKey,
    bool shiftKey,
    bool altKey,
    bool metaKey,
    bool modifierAltGraph,
    bool modifierCapsLock,
    bool modifierFn,
    bool modifierFnLock,
    bool modifierHyper,
    bool modifierNumLock,
    bool modifierScrollLock,
    bool modifierSuper,
    bool modifierSymbol,
    bool modifierSymbolLock,
    int screenX,
    int screenY,
    int clientX,
    int clientY,
    int button,
    int buttons,
    EventTarget? relatedTarget,
    double deltaX,
    double deltaY,
    double deltaZ,
    int deltaMode,
  });

  external double get deltaX;
  external set deltaX(double value);
  external double get deltaY;
  external set deltaY(double value);
  external double get deltaZ;
  external set deltaZ(double value);
  external int get deltaMode;
  external set deltaMode(int value);
}
