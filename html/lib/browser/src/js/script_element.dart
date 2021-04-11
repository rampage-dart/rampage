// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:js';

extension ScriptElementJsObject on JsObject {
  bool get isInstanceOf =>
      instanceof(context['HTMLScriptElement'] as JsFunction);

  String get src => this['src'] as String;
  set src(String value) {
    this['src'] = value;
  }

  String get type => this['type'] as String;
  set type(String value) {
    this['type'] = value;
  }

  bool get noModule => this['noModule'] as bool;
  set noModule(bool value) {
    this['noModule'] = value;
  }

  bool get async => this['async'] as bool;
  set async(bool value) {
    this['async'] = value;
  }

  bool get defer => this['defer'] as bool;
  set defer(bool value) {
    this['defer'] = value;
  }
}
