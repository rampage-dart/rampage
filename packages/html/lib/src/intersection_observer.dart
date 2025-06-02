// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:async';
import 'dart:js_interop';

import 'package:meta/meta.dart';

import 'element.dart';
import 'intersection_observer_entry.dart';
import 'js_interop/convert.dart' as js;
import 'js_interop/intersection_observer.dart' as js;
import 'js_interop/intersection_observer_entry.dart' as js;
import 'js_interop/intersection_observer_init.dart' as js;
import 'js_interop/node.dart' as js;
import 'js_interop/wrapper.dart' as js;
import 'node.dart';
import 'wrapper.dart';

final class IntersectionObserver extends JsWrapper<js.IntersectionObserver> {
  factory IntersectionObserver({
    JsWrapper? root,
    String rootMargin = '0px',
    String scrollMargin = '0px',
    List<double> threshold = const <double>[],
  }) => IntersectionObserver.fromJsObject(
    js.IntersectionObserver(
      _callback.toJS,
      js.IntersectionObserverInit(
        root: root?.jsObject,
        rootMargin: rootMargin,
        scrollMargin: scrollMargin,
        threshold: threshold.toJS,
      ),
    ),
  );

  @protected
  IntersectionObserver.fromJsObject(super.jsObject) : super.fromJsObject();

  final StreamController<IntersectionObserverEntry> _controller =
      StreamController.broadcast();

  Stream<IntersectionObserverEntry> get onIntersection => _controller.stream;

  late final Node? root = safeNodeFromJsObjectNullable(
    jsObject.root as js.Node,
  );

  String get rootMargin => jsObject.rootMargin;

  String get scrollMargin => jsObject.scrollMargin;

  late final List<double> thresholds = jsObject.thresholds.toDart
      .cast<double>();

  void observe(Element target) {
    jsObject.observe(target.jsObject);
  }

  void unobserve(Element target) {
    jsObject.observe(target.jsObject);
  }

  void disconnect() {
    jsObject.disconnect();
  }

  static void _callback(
    JSArray<js.IntersectionObserverEntry> entries,
    js.IntersectionObserver observer,
  ) {
    final controller =
        ((observer as js.DartWrapper).dartObject!.toDart
                as IntersectionObserver)
            ._controller;

    final count = entries.length;
    for (var i = 0; i < count; ++i) {
      controller.add(IntersectionObserverEntry.fromJsObject(entries[i]));
    }
  }
}
