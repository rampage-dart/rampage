// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:js';

import 'ui_event_init.dart';

extension EventModifierInitJsObject on JsObject {
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
    Map<String, Object?> extend = const <String, Object?>{},
  }) =>
      UIEventInitJsObject.construct(
        bubbles: bubbles,
        cancelable: cancelable,
        composed: composed,
        view: view,
        detail: detail,
        extend: <String, Object?>{
          'ctrlKey': ctrlKey,
          'shiftKey': shiftKey,
          'altKey': altKey,
          'metaKey': metaKey,
          'modifierAltGraph': modifierAltGraph,
          'modifierCapsLock': modifierCapsLock,
          'modifierFn': modifierFn,
          'modifierFnLock': modifierFnLock,
          'modifierHyper': modifierHyper,
          'modifierNumLock': modifierNumLock,
          'modifierScrollLock': modifierScrollLock,
          'modifierSuper': modifierSuper,
          'modifierSymbol': modifierSymbol,
          'modifierSymbolLock': modifierSymbolLock,
          ...extend,
        },
      );
}
