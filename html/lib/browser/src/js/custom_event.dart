// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:js';

extension CustomEventJsObject on JsObject {
  static JsFunction _constructor() => context['CustomEvent'] as JsFunction;

  static JsObject construct(
    String type,
    JsObject /* CustomEventInit */ eventInitDict,
  ) =>
      JsObject(
        _constructor(),
        <Object?>[type, eventInitDict],
      );

  bool get isInstanceOf => instanceof(_constructor());

  Object? get detail => this['detail'];
}
