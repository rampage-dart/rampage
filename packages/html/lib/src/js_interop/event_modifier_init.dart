// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'ui_event_init.dart';
import 'window.dart';

extension type EventModifierInit._(JSObject _)
    implements JSObject, UIEventInit {
  external factory EventModifierInit({
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
  });

  external bool get ctrlKey;
  external set ctrlKey(bool value);
  external bool get shiftKey;
  external set shiftKey(bool value);
  external bool get altKey;
  external set altKey(bool value);
  external bool get metaKey;
  external set metaKey(bool value);
  external bool get modifierAltGraph;
  external set modifierAltGraph(bool value);
  external bool get modifierCapsLock;
  external set modifierCapsLock(bool value);
  external bool get modifierFn;
  external set modifierFn(bool value);
  external bool get modifierFnLock;
  external set modifierFnLock(bool value);
  external bool get modifierHyper;
  external set modifierHyper(bool value);
  external bool get modifierNumLock;
  external set modifierNumLock(bool value);
  external bool get modifierScrollLock;
  external set modifierScrollLock(bool value);
  external bool get modifierSuper;
  external set modifierSuper(bool value);
  external bool get modifierSymbol;
  external set modifierSymbol(bool value);
  external bool get modifierSymbolLock;
  external set modifierSymbolLock(bool value);
}
