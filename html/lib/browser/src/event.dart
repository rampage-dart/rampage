// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_browser_interop/browser_interop.dart' as interop;
import 'package:rampage_html/html.dart';

import 'event_target.dart';
import 'js_wrapper.dart';

/// Browser implementation of [Event].
class EventImpl<T extends interop.Event> extends JsWrapper<T> implements Event {
  /// Create an instance of [EventImpl] from the [jsObject].
  EventImpl.fromJsObject(T jsObject) : super.fromJsObject(jsObject);

  @override
  String get type => jsObject.type;

  @override
  EventTarget get target => safeEventTargetFromJsObject(jsObject.target);

  @override
  EventTarget get currentTarget =>
      safeEventTargetFromJsObject(jsObject.currentTarget);

  @override
  bool get bubbles => jsObject.bubbles;

  @override
  bool get cancelable => jsObject.cancelable;

  @override
  bool get composed => jsObject.composed;

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
