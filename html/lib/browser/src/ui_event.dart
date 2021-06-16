// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'event.dart';
import 'js/ui_event.dart';
import 'js/ui_event_init.dart';
import 'window.dart';
import 'wrapper.dart';

/// Browser implementation of [UIEvent].
class UIEventImpl extends EventImpl implements UIEvent {
  /// Creates an instance of [UIEventImpl].
  factory UIEventImpl(
    String type, {
    bool bubbles = false,
    bool cancelable = false,
    bool composed = false,
    Window? view,
    int detail = 0,
  }) =>
      UIEventImpl.fromJsObject(
        UIEventJsObject.construct(
          type,
          UIEventInitJsObject.construct(
            bubbles: bubbles,
            cancelable: cancelable,
            composed: composed,
            view: toJsObjectNullable(view),
            detail: detail,
          ),
        ),
      );

  /// Creates an instance of [UIEventImpl] from the [jsObject].
  UIEventImpl.fromJsObject(JsObject jsObject) : super.fromJsObject(jsObject);

  @override
  Window? get view => safeWindowFromObjectNullable(jsObject.view);

  @override
  int get detail => jsObject.detail;
}
