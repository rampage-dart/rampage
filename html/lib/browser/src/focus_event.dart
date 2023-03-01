// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'event_target_from_js_object.dart';
import 'js/focus_event.dart';
import 'js/focus_event_init.dart';
import 'ui_event.dart';
import 'wrapper.dart';

/// Browser implementation of [FocusEvent].
class FocusEventImpl extends UIEventImpl implements FocusEvent {
  /// Creates an instance of [UIEventImpl].
  factory FocusEventImpl(
    String type, {
    bool bubbles = false,
    bool cancelable = false,
    bool composed = false,
    Window? view,
    int detail = 0,
    EventTarget? relatedTarget,
  }) =>
      FocusEventImpl.fromJsObject(
        FocusEventJsObject.construct(
          type,
          FocusEventInitJsObject.construct(
            bubbles: bubbles,
            cancelable: cancelable,
            composed: composed,
            view: toJsObjectNullable(view),
            detail: detail,
            relatedTarget: toJsObjectNullable(relatedTarget),
          ),
        ),
      );

  /// Creates an instance of [FocusEventImpl] from the [jsObject].
  FocusEventImpl.fromJsObject(super.jsObject) : super.fromJsObject();

  @override
  EventTarget? get relatedTarget =>
      safeEventTargetFromObjectNullable(jsObject.relatedTarget);
}
