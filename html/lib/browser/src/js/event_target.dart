// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:js';

extension EventTargetJsObject on JsObject {
  static JsFunction _constructor() => context['EventTarget'] as JsFunction;

  static JsObject construct() => JsObject(_constructor());

  bool get isInstanceOf => instanceof(_constructor());

  void addEventListener(
    String type,
    JsFunction? /* EventListener */ callback,
    JsObject /* AddEventListenerOptions */ options,
  ) {
    callMethod('addEventListener', <Object?>[type, callback, options]);
  }

  void removeEventListener(
    String type,
    JsFunction? /* EventListener */ callback,
    JsObject /* EventListenerOptions */ options,
  ) {
    callMethod('removeEventListener', <Object?>[type, callback, options]);
  }

  bool dispatchEvent(JsObject /* Event */ event) =>
      callMethod('dispatchEvent', <Object?>[event]) as bool;
}
