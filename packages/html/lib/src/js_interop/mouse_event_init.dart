// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'event_modifier_init.dart';
import 'event_target.dart';
import 'window.dart';

extension type MouseEventInit._(JSObject _)
    implements JSObject, EventModifierInit {
  external factory MouseEventInit({
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
  });

  external int get screenX;
  external set screenX(int value);
  external int get screenY;
  external set screenY(int value);
  external int get clientX;
  external set clientX(int value);
  external int get clientY;
  external set clientY(int value);
  external int get button;
  external set button(int value);
  external int get buttons;
  external set buttons(int value);
  external EventTarget? get relatedTarget;
  external set relatedTarget(EventTarget? value);
}
