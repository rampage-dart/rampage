// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:meta/meta.dart';

import 'event_target.dart';
import 'js_interop/focus_event.dart' as js;
import 'ui_event.dart';

final class FocusEvent extends UIEvent<js.FocusEvent> {
  @protected
  FocusEvent.fromJsObject(super.jsObject) : super.fromJsObject();

  EventTarget? get relatedTarget =>
      safeEventTargetFromJsObjectNullable(jsObject.relatedTarget);
}
