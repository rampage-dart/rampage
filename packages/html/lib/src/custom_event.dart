// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'package:meta/meta.dart';

import 'event.dart';
import 'js_interop/custom_event.dart' as js;
import 'js_interop/custom_event_init.dart' as js;

class CustomEvent extends Event<js.CustomEvent> {
  factory CustomEvent(
    String type, {
    bool bubbles = false,
    bool cancelable = false,
    bool composed = false,
    Object? detail,
  }) => CustomEvent.fromJsObject(
    js.CustomEvent(
      type,
      js.CustomEventInit(
        bubbles: bubbles,
        cancelable: cancelable,
        composed: composed,
        detail: detail?.toJSBox,
      ),
    ),
  );

  @protected
  CustomEvent.fromJsObject(super.jsObject) : super.fromJsObject();

  Object? get detail => (jsObject.detail as JSBoxedDartObject?)?.toDart;
}
