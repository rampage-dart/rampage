// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:js';

extension DomParserJsObject on JsObject {
  static JsFunction _constructor() => context['DOMParser'] as JsFunction;

  static JsObject construct() => JsObject(_constructor());

  bool get isInstanceOf => instanceof(_constructor());

  JsObject parseFromString(String string, String type) {
    final result =
        callMethod('parseFromString', <Object?>[string, type]) as Object;

    return JsObject.fromBrowserObject(result);
  }
}
