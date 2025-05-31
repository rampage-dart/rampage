// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

extension type EventInit._(JSObject _) implements JSObject {
  external factory EventInit({bool bubbles, bool cancelable, bool composed});

  external bool get bubbles;
  external set bubbles(bool value);
  external bool get cancelable;
  external set cancelable(bool value);
  external bool get composed;
  external set composed(bool value);
}
