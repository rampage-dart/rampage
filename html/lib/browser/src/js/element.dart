// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

// ignore_for_file: public_member_api_docs, avoid_positional_boolean_parameters

import 'dart:js';

extension ElementJsObject on JsObject {
  bool get isInstanceOf => instanceof(context['Element'] as JsFunction);

  String get tagName => this['tagName'] as String;

  String get className => this['className'] as String;
  set className(String value) {
    this['className'] = value;
  }

  String get id => this['id'] as String;
  set id(String value) {
    this['id'] = value;
  }

  String get slot => this['slot'] as String;
  set slot(String value) {
    this['slot'] = value;
  }

  Object? get shadowRoot => this['shadowRoot'];

  Object attachShadow(JsObject init) =>
      callMethod('attachShadow', <Object?>[init]) as Object;
}
