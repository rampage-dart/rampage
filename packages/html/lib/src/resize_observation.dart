// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:meta/meta.dart';

import 'element.dart';
import 'js_interop/resize_observation.dart' as js;
import 'resize_observer_box_options.dart';
import 'resize_observer_size.dart';
import 'wrapper.dart';

final class ResizeObservation extends JsWrapper<js.ResizeObservation> {
  @protected
  ResizeObservation.fromJsObject(super.jsObject) : super.fromJsObject();

  late final Element target = safeElementFromJsObject(jsObject.target);

  late final ResizeObserverBoxOptions observedBox = jsObject.observedBox.toDart;

  late final List<ResizeObserverSize> lastReportedSizes =
      jsObject.lastReportedSizes.toDart;
}
