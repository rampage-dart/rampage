// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'js/wheel_event.dart';
import 'js/wheel_event_init.dart';
import 'mouse_event.dart';

/// Browser implementation of [WheelEvent].
class WheelEventImpl extends MouseEventImpl implements WheelEvent {
  factory WheelEventImpl(
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
    double deltaX = 0.0,
    double deltaY = 0.0,
    double deltaZ = 0.0,
    int deltaMode = 0,
  }) =>
      WheelEventImpl.fromJsObject(WheelEventJsObject.construct(
        type,
        WheelEventInitJsObject.construct(
          bubbles: bubbles,
          cancelable: cancelable,
          composed: composed,
          view: null, //view,
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
          relatedTarget: null,
          deltaX: deltaX,
          deltaY: deltaY,
          deltaZ: deltaZ,
          deltaMode: deltaMode,
        ),
      ));

  /// Creates an instance of [WheelEventImpl] from the [jsObject].
  WheelEventImpl.fromJsObject(JsObject jsObject) : super.fromJsObject(jsObject);

  @override
  double get deltaX => jsObject.deltaX;

  @override
  double get deltaY => jsObject.deltaY;

  @override
  double get deltaZ => jsObject.deltaZ;
}
