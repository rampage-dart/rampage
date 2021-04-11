// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:js';

extension CssStyleSheetInitJsObject on JsObject {
  static JsObject construct({
    required String media,
    required String title,
    required bool alternate,
    required bool disabled,
  }) =>
      JsObject.jsify(<String, Object?>{
        'media': media,
        'title': title,
        'alternate': alternate,
        'disabled': disabled,
      });
}
