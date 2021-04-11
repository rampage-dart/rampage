// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:js';

import 'promise.dart';

extension ImageElementJsObject on JsObject {
  bool get isInstanceOf =>
      instanceof(context['HTMLImageElement'] as JsFunction);

  String get src => this['src'] as String;
  set src(String value) {
    this['src'] = value;
  }

  int get width => this['width'] as int;
  set width(int value) {
    this['width'] = value;
  }

  int get height => this['height'] as int;
  set height(int value) {
    this['height'] = value;
  }

  int get naturalWidth => this['naturalWidth'] as int;
  int get naturalHeight => this['naturalHeight'] as int;

  Future<void> decode() =>
      promiseToFuture<void>(callMethod('decode') as JsObject);
}
