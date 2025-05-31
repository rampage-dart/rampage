// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'event_modifier_init.dart';
import 'window.dart';

extension type KeyboardEventInit._(JSObject _)
    implements JSObject, EventModifierInit {
  external factory KeyboardEventInit({
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
    String key,
    String code,
    int location,
    bool repeat,
    bool isComposing,
    int charCode,
    int keyCode,
  });

  external String get key;
  external set key(String value);
  external String get code;
  external set code(String value);
  external int get location;
  external set location(int value);
  external bool get repeat;
  external set repeat(bool value);
  external bool get isComposing;
  external set isComposing(bool value);
  external int get charCode;
  external set charCode(int value);
  external int get keyCode;
  external set keyCode(int value);
}
