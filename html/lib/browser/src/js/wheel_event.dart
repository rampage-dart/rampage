// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:js';

extension WheelEventJsObject on JsObject {
  static JsFunction _constructor() => context['WheelEvent'] as JsFunction;

  static JsObject construct(
    String type,
    JsObject /* WheelEventInit */ eventInitDict,
  ) =>
      JsObject(
        _constructor(),
        <Object?>[type, eventInitDict],
      );

  bool get isInstanceOf => instanceof(_constructor());

  double get deltaX => this['deltaX'] as double;
  double get deltaY => this['deltaY'] as double;
  double get deltaZ => this['deltaZ'] as double;
  int get deltaMode => this['deltaMode'] as int;
}
