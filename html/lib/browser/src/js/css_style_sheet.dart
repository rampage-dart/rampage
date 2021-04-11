// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:js';

extension CssStyleSheetJsObject on JsObject {
  static JsFunction _constructor() => context['CSSStyleSheet'] as JsFunction;

  static JsObject construct(JsObject /* CssStyleSheetInit */ options) =>
      JsObject(
        _constructor(),
        <Object?>[options],
      );

  bool get isInstanceOf => instanceof(_constructor());

  void replaceSync(String text) => callMethod('replaceSync', <Object?>[text]);
}
