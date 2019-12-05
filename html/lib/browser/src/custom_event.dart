// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_browser_interop/browser_interop.dart' as interop;
import 'package:rampage_html/html.dart';

import 'event.dart';

/// Browser implementation of [CustomEvent].
class CustomEventImpl extends EventImpl<interop.CustomEvent>
    implements CustomEvent {
  /// Creates an instance of [CustomEventImpl].
  factory CustomEventImpl(
    String type, {
    bool bubbles = false,
    bool cancelable = false,
    bool composed = false,
    dynamic detail,
  }) =>
      CustomEventImpl.fromJsObject(interop.CustomEvent(
        type,
        interop.CustomEventInit(
          bubbles: bubbles,
          cancelable: cancelable,
          composed: composed,
          detail: detail,
        ),
      ));

  /// Creates an instance of [CustomEventImpl] from the [jsObject].
  CustomEventImpl.fromJsObject(interop.CustomEvent jsObject)
      : super.fromJsObject(jsObject);

  @override
  dynamic get detail => jsObject.detail;
}
