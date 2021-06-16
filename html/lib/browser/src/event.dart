// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'event_target_from_js_object.dart';
import 'js/event.dart';
import 'wrapper.dart';

/// Browser implementation of [Event].
class EventImpl extends DartJsWrapper implements Event {
  /// Create an instance of [EventImpl] from the [jsObject].
  EventImpl.fromJsObject(JsObject jsObject) : super.fromJsObject(jsObject);

  @override
  String get type => jsObject.type;

  @override
  EventTarget? get target => safeEventTargetFromObjectNullable(jsObject.target);

  @override
  EventTarget? get currentTarget =>
      safeEventTargetFromObjectNullable(jsObject.currentTarget);

  @override
  EventPhase get eventPhase => EventPhase.values[jsObject.eventPhase];

  @override
  bool get bubbles => jsObject.bubbles;

  @override
  bool get cancelable => jsObject.cancelable;

  @override
  bool get defaultPrevented => jsObject.defaultPrevented;

  @override
  bool get composed => jsObject.composed;

  @override
  double get timeStamp => jsObject.timeStamp;

  @override
  void preventDefault() {
    jsObject.preventDefault();
  }

  @override
  void stopImmediatePropagation() {
    jsObject.stopImmediatePropagation();
  }

  @override
  void stopPropagation() {
    jsObject.stopPropagation();
  }
}
