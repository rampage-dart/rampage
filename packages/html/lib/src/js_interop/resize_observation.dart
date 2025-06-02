// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'element.dart';
import 'resize_observer_box_options.dart';
import 'resize_observer_size.dart';

extension type ResizeObservation._(JSObject _) implements JSObject {
  external Element get target;
  external ResizeObserverBoxOptions get observedBox;
  external JSArray<ResizeObserverSize> get lastReportedSizes;
}
