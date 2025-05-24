// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:meta/meta.dart';

import 'event_target.dart';
import 'js_interop/event.dart' as js;
import 'wrapper.dart';

class Event<T extends js.Event> extends DartJsWrapper<T> {
  @protected
  Event.fromJsObject(super.jsObject) : super.fromJsObject();

  String get type => jsObject.type;

  EventTarget? get target =>
      safeEventTargetFromJsObjectNullable(jsObject.target);

  EventTarget? get currentTarget =>
      safeEventTargetFromJsObjectNullable(jsObject.currentTarget);

  bool get bubbles => jsObject.bubbles;

  bool get cancelable => jsObject.cancelable;

  bool get defaultPrevented => jsObject.defaultPrevented;

  bool get composed => jsObject.composed;

  double get timeStamp => jsObject.timeStamp;

  void preventDefault() {
    jsObject.preventDefault();
  }

  void stopImmediatePropagation() {
    jsObject.stopImmediatePropagation();
  }

  void stopPropagation() {
    jsObject.stopPropagation();
  }
}
