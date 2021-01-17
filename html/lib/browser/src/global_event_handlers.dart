// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_html/html.dart';

import 'event_target.dart';

/// Browser implementation of [GlobalEventHandlers].
mixin GlobalEventHandlersImpl on EventTargetImpl
    implements GlobalEventHandlers {
  @override
  late final Stream<MouseEvent> onClick = on['click']!.cast<MouseEvent>();

  @override
  late final Stream<MouseEvent> onDoubleClick =
      on['dblclick']!.cast<MouseEvent>();

  @override
  late final Stream<MouseEvent> onMouseDown =
      on['mousedown']!.cast<MouseEvent>();

  @override
  late final Stream<MouseEvent> onMouseEnter =
      on['mouseenter']!.cast<MouseEvent>();

  @override
  late final Stream<MouseEvent> onMouseLeave =
      on['mouseleave']!.cast<MouseEvent>();

  @override
  late final Stream<MouseEvent> onMouseMove =
      on['mousemove']!.cast<MouseEvent>();

  @override
  late final Stream<MouseEvent> onMouseOut = on['mouseout']!.cast<MouseEvent>();

  @override
  late final Stream<MouseEvent> onMouseOver =
      on['mouseover']!.cast<MouseEvent>();

  @override
  late final Stream<MouseEvent> onMouseUp = on['mouseup']!.cast<MouseEvent>();

  @override
  late final Stream<KeyboardEvent> onKeyUp = on['keyup']!.cast<KeyboardEvent>();

  @override
  late final Stream<KeyboardEvent> onKeyDown =
      on['keydown']!.cast<KeyboardEvent>();

  @override
  late final Stream<FocusEvent> onBlur = on['blur']!.cast<FocusEvent>();

  @override
  late final Stream<FocusEvent> onFocus = on['focus']!.cast<FocusEvent>();

  @override
  late final Stream<FocusEvent> onFocusIn = on['focusin']!.cast<FocusEvent>();

  @override
  late final Stream<FocusEvent> onFocusOut = on['focusout']!.cast<FocusEvent>();

  @override
  late final Stream<WheelEvent> onWheel = on['wheel']!.cast<WheelEvent>();
}
