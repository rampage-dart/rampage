// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:async';

import 'event_target.dart';
import 'focus_event.dart';
import 'keyboard_event.dart';
import 'mouse_event.dart';
import 'wheel_event.dart';

/// Describes the event handlers common to several interfaces like
/// [HtmlElement], [Document], or [Window].
///
/// Each of these interfaces can, of course, add more event handlers in
/// addition to the ones listed below.
abstract class GlobalEventHandlers implements EventTarget {
  /// Stream of `click` events handled by this [EventTarget].
  Stream<MouseEvent> get onClick;

  /// Stream of `dblclick` events handled by this [EventTarget].
  Stream<MouseEvent> get onDoubleClick;

  /// Stream of `mousedown` events handled by this [EventTarget].
  Stream<MouseEvent> get onMouseDown;

  /// Stream of `mouseenter` events handled by this [EventTarget].
  Stream<MouseEvent> get onMouseEnter;

  /// Stream of `mouseleave` events handled by this [EventTarget].
  Stream<MouseEvent> get onMouseLeave;

  /// Stream of `mousemove` events handled by this [EventTarget].
  Stream<MouseEvent> get onMouseMove;

  /// Stream of `mouseout` events handled by this [EventTarget].
  Stream<MouseEvent> get onMouseOut;

  /// Stream of `mouseover` events handled by this [EventTarget].
  Stream<MouseEvent> get onMouseOver;

  /// Stream of `mouseup` events handled by this [EventTarget].
  Stream<MouseEvent> get onMouseUp;

  /// Stream of `keyup` events handled by this [EventTarget].
  Stream<KeyboardEvent> get onKeyUp;

  /// Stream of `keydown` events handled by this [EventTarget].
  Stream<KeyboardEvent> get onKeyDown;

  /// Stream of `blur` events handled by this [EventTarget].
  Stream<FocusEvent> get onBlur;

  /// Stream of `focus` events handled by this [EventTarget].
  Stream<FocusEvent> get onFocus;

  /// Stream of `focusin` events handled by this [EventTarget].
  Stream<FocusEvent> get onFocusIn;

  /// Stream of `focusout` events handled by this [EventTarget].
  Stream<FocusEvent> get onFocusOut;

  /// Stream of `wheel` events handled by this [EventTarget].
  Stream<WheelEvent> get onWheel;
}
