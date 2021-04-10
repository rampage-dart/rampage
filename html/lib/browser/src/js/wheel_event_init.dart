// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:js';

import 'mouse_event_init.dart';

extension WheelEventInitJsObject on JsObject {
  static JsObject construct({
    required bool bubbles,
    required bool cancelable,
    required bool composed,
    required JsObject? /* Window */ view,
    required int detail,
    required bool ctrlKey,
    required bool shiftKey,
    required bool altKey,
    required bool metaKey,
    required bool modifierAltGraph,
    required bool modifierCapsLock,
    required bool modifierFn,
    required bool modifierFnLock,
    required bool modifierHyper,
    required bool modifierNumLock,
    required bool modifierScrollLock,
    required bool modifierSuper,
    required bool modifierSymbol,
    required bool modifierSymbolLock,
    required int screenX,
    required int screenY,
    required int clientX,
    required int clientY,
    required int button,
    required int buttons,
    required JsObject? /* EventTarget */ relatedTarget,
    required double deltaX,
    required double deltaY,
    required double deltaZ,
    required int deltaMode,
  }) =>
      MouseEventInitJsObject.construct(
        bubbles: bubbles,
        cancelable: cancelable,
        composed: composed,
        view: view,
        detail: detail,
        ctrlKey: ctrlKey,
        shiftKey: shiftKey,
        altKey: altKey,
        metaKey: metaKey,
        modifierAltGraph: modifierAltGraph,
        modifierCapsLock: modifierCapsLock,
        modifierFn: modifierFn,
        modifierFnLock: modifierFnLock,
        modifierHyper: modifierHyper,
        modifierNumLock: modifierNumLock,
        modifierScrollLock: modifierScrollLock,
        modifierSuper: modifierSuper,
        modifierSymbol: modifierSymbol,
        modifierSymbolLock: modifierSymbolLock,
        screenX: screenX,
        screenY: screenY,
        clientX: clientX,
        clientY: clientY,
        button: button,
        buttons: buttons,
        relatedTarget: relatedTarget,
        extend: <String, Object?>{
          'deltaX': deltaX,
          'deltaY': deltaY,
          'deltaZ': deltaZ,
          'deltaMode': deltaMode,
        },
      );
}
