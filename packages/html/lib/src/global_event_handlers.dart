// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'event_target.dart';
import 'focus_event.dart';
import 'js_interop/event_target.dart' as js;
import 'keyboard_event.dart';
import 'mouse_event.dart';
import 'wheel_event.dart';

abstract mixin class GlobalEventHandlers<T extends js.EventTarget>
    implements EventTarget<T> {
  late final Stream<MouseEvent> onClick = on['click']!.cast<MouseEvent>();

  late final Stream<MouseEvent> onDoubleClick = on['dblclick']!
      .cast<MouseEvent>();

  late final Stream<MouseEvent> onMouseDown = on['mousedown']!
      .cast<MouseEvent>();

  late final Stream<MouseEvent> onMouseEnter = on['mouseenter']!
      .cast<MouseEvent>();

  late final Stream<MouseEvent> onMouseLeave = on['mouseleave']!
      .cast<MouseEvent>();

  late final Stream<MouseEvent> onMouseMove = on['mousemove']!
      .cast<MouseEvent>();

  late final Stream<MouseEvent> onMouseOut = on['mouseout']!.cast<MouseEvent>();

  late final Stream<MouseEvent> onMouseOver = on['mouseover']!
      .cast<MouseEvent>();

  late final Stream<MouseEvent> onMouseUp = on['mouseup']!.cast<MouseEvent>();

  late final Stream<KeyboardEvent> onKeyUp = on['keyup']!.cast<KeyboardEvent>();

  late final Stream<KeyboardEvent> onKeyDown = on['keydown']!
      .cast<KeyboardEvent>();

  late final Stream<FocusEvent> onBlur = on['blur']!.cast<FocusEvent>();

  late final Stream<FocusEvent> onFocus = on['focus']!.cast<FocusEvent>();

  late final Stream<FocusEvent> onFocusIn = on['focusin']!.cast<FocusEvent>();

  late final Stream<FocusEvent> onFocusOut = on['focusout']!.cast<FocusEvent>();

  late final Stream<WheelEvent> onWheel = on['wheel']!.cast<WheelEvent>();
}
