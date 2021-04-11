// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:js';

extension HtmlElementJsObject on JsObject {
  bool get isInstanceOf => instanceof(context['HTMLElement'] as JsFunction);

  String get title => this['title'] as String;
  set title(String value) {
    this['title'] = value;
  }

  String get lang => this['lang'] as String;
  set lang(String value) {
    this['lang'] = value;
  }

  String get dir => this['dir'] as String;
  set dir(String value) {
    this['dir'] = value;
  }

  bool get hidden => this['hidden'] as bool;
  set hidden(bool value) {
    this['hidden'] = value;
  }

  void click() {
    callMethod('click');
  }

  String get innerText => this['innerText'] as String;
  set innerText(String value) {
    this['innerText'] = value;
  }
}
