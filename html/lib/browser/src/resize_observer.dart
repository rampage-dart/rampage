// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:async';
import 'dart:js';

import 'package:rampage_html/html.dart';

import 'element_from_js_object.dart';
import 'js/resize_observer.dart';
import 'js/resize_observer_entry.dart';
import 'observer_stream.dart';
import 'rectangle.dart';
import 'wrapper.dart';

/// Browser implementation of [ResizeObserver].
class ResizeObserverImpl extends DartJsWrapper
    with ObserverImpl
    implements ResizeObserver {
  /// Create an instance of [ResizeObserverImpl].
  factory ResizeObserverImpl() => ResizeObserverImpl.fromJsObject(
        ResizeObserverJsObject.construct(
          JsFunction.withThis(_resizeCallback),
        ),
      );

  /// Create an instance of [ResizeObserverImpl] from the [jsObject].
  ResizeObserverImpl.fromJsObject(JsObject jsObject)
      : super.fromJsObject(jsObject);

  // ignore: close_sinks
  late final StreamController<ResizeObserverEntryImpl> _streamController =
      StreamController<ResizeObserverEntryImpl>.broadcast(
    onCancel: disconnect,
  );

  @override
  late final ObserverStream<ResizeObserverEntry> onResize =
      ObserverStreamImpl<ResizeObserverImpl, ResizeObserverEntryImpl>(
    _streamController.stream,
    this,
  );

  @override
  void disconnect() {
    jsObject.disconnect();
  }

  static void _resizeCallback(
    Object? scope,
    List<Object?> entries,
    JsObject observer,
  ) {
    final dartObserver = observer.dartObject! as ResizeObserverImpl;

    for (final entry in entries) {
      dartObserver._streamController.add(
        ResizeObserverEntryImpl.fromJsObject(
          JsObject.fromBrowserObject(entry!),
        ),
      );
    }
  }
}

/// Browser implementation of [ResizeObserverEntryImpl].
class ResizeObserverEntryImpl extends JsWrapper
    implements ObserverEntry, ResizeObserverEntry {
  /// Create an instance of [ResizeObserverEntryImpl].
  ResizeObserverEntryImpl.fromJsObject(JsObject jsObject)
      : super.fromJsObject(jsObject);

  @override
  late final Element target = safeElementFromObject(jsObject.target);

  @override
  late final ImmutableRectangle contentRect =
      ImmutableRectangleImpl.fromJsObject(
    JsObject.fromBrowserObject(jsObject.contentRect),
  );

  @override
  bool isTarget(Element element) => target == element;
}
