// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'event.dart';
import 'js/custom_event.dart';
import 'js/custom_event_init.dart';

/// Browser implementation of [CustomEvent].
class CustomEventImpl extends EventImpl implements CustomEvent {
  /// Creates an instance of [CustomEventImpl].
  factory CustomEventImpl(
    String type, {
    bool bubbles = false,
    bool cancelable = false,
    bool composed = false,
    Object? detail,
  }) =>
      CustomEventImpl.fromJsObject(
        CustomEventJsObject.construct(
          type,
          CustomEventInitJsObject.construct(
            bubbles: bubbles,
            cancelable: cancelable,
            composed: composed,
            detail: detail,
          ),
        ),
      );

  /// Creates an instance of [CustomEventImpl] from the [jsObject].
  CustomEventImpl.fromJsObject(JsObject jsObject)
      : super.fromJsObject(jsObject);

  @override
  Object? get detail => jsObject.detail;
}
