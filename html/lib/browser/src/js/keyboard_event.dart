// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:js';

extension KeyboardEventJsObject on JsObject {
  static JsFunction _constructor() => context['KeyboardEvent'] as JsFunction;

  static JsObject construct(
    String type,
    JsObject /* KeyboardEventInit */ eventInitDict,
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

  String get key => this['key'] as String;
  String get code => this['code'] as String;
  int get location => this['location'] as int;

  bool get ctrlKey => this['ctrlKey'] as bool;
  bool get shiftKey => this['ctrlKey'] as bool;
  bool get altKey => this['ctrlKey'] as bool;
  bool get metaKey => this['ctrlKey'] as bool;

  bool get repeat => this['ctrlKey'] as bool;
  bool get isComposing => this['ctrlKey'] as bool;

  bool getModifierState(String keyArg) =>
      callMethod('getModifierState', <Object?>[keyArg]) as bool;
}
