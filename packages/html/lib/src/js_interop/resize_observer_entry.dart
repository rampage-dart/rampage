// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'dom_rect_read_only.dart';
import 'element.dart';
import 'resize_observer_size.dart';

extension type ResizeObserverEntry._(JSObject _) implements JSObject {
  external Element get target;
  external DomRectReadOnly get contentRect;
  external JSArray<ResizeObserverSize> get borderBoxSize;
  external JSArray<ResizeObserverSize> get contentBoxSize;
  external JSArray<ResizeObserverSize> get devicePixelContentBoxSize;
}
