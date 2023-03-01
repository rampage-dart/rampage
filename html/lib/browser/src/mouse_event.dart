// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_html/html.dart';

import 'event_target_from_js_object.dart';
import 'js/mouse_event.dart';
import 'js/mouse_event_init.dart';
import 'ui_event.dart';
import 'wrapper.dart';

/// Browser implementation of [MouseEvent].
class MouseEventImpl extends UIEventImpl implements MouseEvent {
  /// Creates an instance of [MouseEventImpl].
  factory MouseEventImpl(
    String type, {
    bool bubbles = false,
    bool cancelable = false,
    bool composed = false,
    Window? view,
    int detail = 0,
    bool ctrlKey = false,
    bool shiftKey = false,
    bool altKey = false,
    bool metaKey = false,
    bool modifierAltGraph = false,
    bool modifierCapsLock = false,
    bool modifierFn = false,
    bool modifierFnLock = false,
    bool modifierHyper = false,
    bool modifierNumLock = false,
    bool modifierScrollLock = false,
    bool modifierSuper = false,
    bool modifierSymbol = false,
    bool modifierSymbolLock = false,
    int screenX = 0,
    int screenY = 0,
    int clientX = 0,
    int clientY = 0,
    int button = 0,
    int buttons = 0,
    EventTarget? relatedTarget,
  }) =>
      MouseEventImpl.fromJsObject(
        MouseEventJsObject.construct(
          type,
          MouseEventInitJsObject.construct(
            bubbles: bubbles,
            cancelable: cancelable,
            composed: composed,
            view: toJsObjectNullable(view),
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
            relatedTarget: toJsObjectNullable(relatedTarget),
          ),
        ),
      );

  /// Creates an instance of [MouseEventImpl] from the [jsObject].
  MouseEventImpl.fromJsObject(super.jsObject) : super.fromJsObject();

  @override
  int get screenX => jsObject.screenX;

  @override
  int get screenY => jsObject.screenY;

  @override
  int get clientX => jsObject.clientX;

  @override
  int get clientY => jsObject.clientY;

  @override
  bool get ctrlKey => jsObject.ctrlKey;

  @override
  bool get shiftKey => jsObject.shiftKey;

  @override
  bool get altKey => jsObject.altKey;

  @override
  bool get metaKey => jsObject.metaKey;

  @override
  int get button => jsObject.button;

  @override
  EventTarget? get relatedTarget =>
      safeEventTargetFromObjectNullable(jsObject.relatedTarget);
}
