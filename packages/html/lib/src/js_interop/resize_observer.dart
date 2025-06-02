// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'element.dart';
import 'resize_observer_callback.dart';
import 'resize_observer_options.dart';

extension type ResizeObserver._(JSObject _) implements JSObject {
  external factory ResizeObserver(ResizeObserverCallback callback);

  external void observe(Element target, [ResizeObserverOptions options]);
  external void unobserve(Element target);
  external void disconnect();
}
