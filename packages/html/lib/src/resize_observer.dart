// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:async';
import 'dart:js_interop';

import 'package:meta/meta.dart';

import 'element.dart';
import 'js_interop/resize_observer.dart' as js;
import 'js_interop/resize_observer_entry.dart' as js;
import 'js_interop/resize_observer_options.dart' as js;
import 'js_interop/wrapper.dart' as js;
import 'resize_observer_box_options.dart';
import 'resize_observer_entry.dart';
import 'wrapper.dart';

final class ResizeObserver extends DartJsWrapper<js.ResizeObserver> {
  factory ResizeObserver() =>
      ResizeObserver.fromJsObject(js.ResizeObserver(_callback.toJS));

  @protected
  ResizeObserver.fromJsObject(super.jsObject) : super.fromJsObject();

  final StreamController<ResizeObserverEntry> _controller =
      StreamController.broadcast();

  Stream<ResizeObserverEntry> get onResize => _controller.stream;

  void observe(
    Element target, {
    ResizeObserverBoxOptions box = ResizeObserverBoxOptions.contentBox,
  }) {
    jsObject.observe(target.jsObject, js.ResizeObserverOptions(box: box.toJS));
  }

  void unobserve(Element target) {
    jsObject.unobserve(target.jsObject);
  }

  void disconnect() {
    jsObject.disconnect();
  }

  static void _callback(
    JSArray<js.ResizeObserverEntry> entries,
    js.ResizeObserver observer,
  ) {
    final controller =
        ((observer as js.DartWrapper).dartObject!.toDart as ResizeObserver)
            ._controller;

    final count = entries.length;
    for (var i = 0; i < count; ++i) {
      controller.add(ResizeObserverEntry.fromJsObject(entries[i]));
    }
  }
}
