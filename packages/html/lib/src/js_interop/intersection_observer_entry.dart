// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'dom_high_res_time_stamp.dart';
import 'dom_rect_read_only.dart';
import 'element.dart';

extension type IntersectionObserverEntry._(JSObject _) implements JSObject {
  external DomHighResTimeStamp get time;
  external DomRectReadOnly? get rootBounds;
  external DomRectReadOnly get boundingClientRect;
  external DomRectReadOnly get intersectionRect;
  external bool get isIntersecting;
  external double get intersectionRatio;
  external Element get target;
}
