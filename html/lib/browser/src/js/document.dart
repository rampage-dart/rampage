// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:js';

extension DocumentJsObject on JsObject {
  static JsFunction _constructor() => context['Document'] as JsFunction;

  static JsObject construct() => JsObject(_constructor());

  bool get isInstanceOf => instanceof(_constructor());

  Object? get body => this['body'];
  set body(Object? value) {
    this['body'] = value;
  }

  Object? get head => this['head'];
  Object? get documentElement => this['documentElement'];

  Object createElement(String localName) =>
      callMethod('createElement', <Object?>[localName]) as Object;

  Object createElementNS(String namespace, String localName) =>
      callMethod('createElementNS', <Object?>[namespace, localName]) as Object;
}
