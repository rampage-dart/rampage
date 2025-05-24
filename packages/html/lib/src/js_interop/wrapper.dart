// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

/// A JavaScript object that wraps a Dart object.
extension type DartWrapper(JSObject _) implements JSObject {
  @JS(r'$dart')
  external JSBoxedDartObject? dartObject;
}
