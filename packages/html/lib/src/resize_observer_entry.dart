// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:meta/meta.dart';

import 'dom_rect_read_only.dart';
import 'element.dart';
import 'js_interop/resize_observer_entry.dart' as js;
import 'resize_observer_size.dart';
import 'wrapper.dart';

final class ResizeObserverEntry extends JsWrapper<js.ResizeObserverEntry> {
  @protected
  ResizeObserverEntry.fromJsObject(super.jsObject) : super.fromJsObject();

  late final Element target = safeElementFromJsObject(jsObject.target);

  DomRectReadOnly get contentRect => jsObject.contentRect;

  late final List<ResizeObserverSize> borderBoxSize =
      jsObject.borderBoxSize.toDart;

  late final List<ResizeObserverSize> contentBoxSize =
      jsObject.contentBoxSize.toDart;

  late final List<ResizeObserverSize> devicePixelContentBoxSize =
      jsObject.devicePixelContentBoxSize.toDart;
}
