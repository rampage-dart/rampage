// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:meta/meta.dart';

import 'dom_high_res_time_stamp.dart';
import 'dom_rect_read_only.dart';
import 'element.dart';
import 'js_interop/intersection_observer_entry.dart' as js;
import 'wrapper.dart';

final class IntersectionObserverEntry
    extends JsWrapper<js.IntersectionObserverEntry> {
  @protected
  IntersectionObserverEntry.fromJsObject(super.jsObject) : super.fromJsObject();

  DomHighResTimeStamp get time => jsObject.time;

  DomRectReadOnly? get rootBounds => jsObject.rootBounds;

  DomRectReadOnly get boundingClientRect => jsObject.boundingClientRect;

  DomRectReadOnly get intersectionRect => jsObject.intersectionRect;

  bool get isIntersecting => jsObject.isIntersecting;

  double get intersectionRatio => jsObject.intersectionRatio;

  late final Element target = safeElementFromJsObject(jsObject.target);
}
