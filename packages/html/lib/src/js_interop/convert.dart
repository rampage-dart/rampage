// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

extension DoubleListJSObject on List<double> {
  JSArray<JSNumber> get toJS {
    if (isEmpty) {
      return JSArray<JSNumber>();
    }

    final jsArray = JSArray<JSNumber>.withLength(length);
    for (var i = 0; i < length; ++i) {
      jsArray[i] = this[i].toJS;
    }

    return jsArray;
  }
}
