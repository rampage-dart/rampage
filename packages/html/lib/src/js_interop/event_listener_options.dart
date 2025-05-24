// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

extension type EventListenerOptions._(JSObject _) implements JSObject {
  external factory EventListenerOptions({bool capture});

  external bool get capture;
  external set capture(bool value);
}
