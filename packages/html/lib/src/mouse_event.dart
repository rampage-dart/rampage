// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:meta/meta.dart';

import 'event_target.dart';
import 'js_interop/mouse_event.dart' as js;
import 'ui_event.dart';

class MouseEvent<T extends js.MouseEvent> extends UIEvent<T> {
  @protected
  MouseEvent.fromJsObject(super.jsObject) : super.fromJsObject();

  int get screenX => jsObject.screenX;

  int get screenY => jsObject.screenY;

  int get clientX => jsObject.clientX;

  int get clientY => jsObject.clientY;

  int get layerX => jsObject.layerX;

  int get layerY => jsObject.layerY;

  bool get ctrlKey => jsObject.ctrlKey;

  bool get shiftKey => jsObject.shiftKey;

  bool get altKey => jsObject.altKey;

  bool get metaKey => jsObject.metaKey;

  int get button => jsObject.button;

  int get buttons => jsObject.buttons;

  EventTarget? get relatedTarget =>
      safeEventTargetFromJsObjectNullable(jsObject.relatedTarget);
}
