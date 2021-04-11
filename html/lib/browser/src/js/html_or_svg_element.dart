// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

// ignore_for_file: public_member_api_docs, avoid_positional_boolean_parameters

import 'dart:js';

extension HtmlOrSvgElementJsObject on JsObject {
  void focus(bool preventScroll) =>
      callMethod('focus', <Object?>[preventScroll]);
  void blur() => callMethod('blur');
}
