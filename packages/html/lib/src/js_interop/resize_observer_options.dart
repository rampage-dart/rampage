// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'resize_observer_box_options.dart';

extension type ResizeObserverOptions._(JSObject _) implements JSObject {
  external factory ResizeObserverOptions({ResizeObserverBoxOptions box});

  external ResizeObserverBoxOptions get box;
  external set box(ResizeObserverBoxOptions value);
}
