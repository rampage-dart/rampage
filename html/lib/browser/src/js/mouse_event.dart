// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:js';

extension MouseEventJsObject on JsObject {
  static JsFunction get _constructor => context['MouseEvent'] as JsFunction;

  static JsObject construct(
    String type,
    JsObject /* MouseEventInit */ eventInitDict,
  ) =>
      JsObject(_constructor, <Object?>[type, eventInitDict]);

  bool get isInstanceOf => instanceof(_constructor);

  int get screenX => this['screenX'] as int;
  int get screenY => this['screenY'] as int;
  int get clientX => this['clientX'] as int;
  int get clientY => this['clientY'] as int;
  bool get ctrlKey => this['ctrlKey'] as bool;
  bool get shiftKey => this['shiftKey'] as bool;
  bool get altKey => this['altKey'] as bool;
  bool get metaKey => this['metaKey'] as bool;
  int get button => this['button'] as int;
  int get buttons => this['buttons'] as int;
  Object? get relatedTarget => this['relatedTarget'];

  bool getModifierState(String keyArg) =>
      callMethod('getModifierState', <String>[keyArg]) as bool;
}
