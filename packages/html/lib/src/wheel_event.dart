// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:meta/meta.dart';

import 'js_interop/wheel_event.dart' as js;
import 'mouse_event.dart';

final class WheelEvent extends MouseEvent<js.WheelEvent> {
  @protected
  WheelEvent.fromJsObject(super.jsObject) : super.fromJsObject();

  double get deltaX => jsObject.deltaX;

  double get deltaY => jsObject.deltaY;

  double get deltaZ => jsObject.deltaZ;

  int get deltaMode => jsObject.deltaMode;
}
