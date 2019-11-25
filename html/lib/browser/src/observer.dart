// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:async';

import 'package:rampage_browser_interop/browser_interop.dart' as interop;
import 'package:rampage_html/browser/html.dart';
import 'package:rampage_html/html.dart';

import 'element.dart';
import 'geometry.dart';
import 'js_wrapper.dart';

//------------------------------------------------------------------------------
// ResizeObserver
//------------------------------------------------------------------------------

/// Browser implementation of [ResizeObserver].
class ResizeObserverImpl extends JsWrapper<interop.ResizeObserver>
    implements ResizeObserver {
  /// Create an instance of [ResizeObserverImpl].
  factory ResizeObserverImpl() =>
      ResizeObserverImpl.fromJsObject(interop.ResizeObserver(_resizeCallback));

  /// Create an instance of [ResizeObserverImpl] from the [jsObject].
  ResizeObserverImpl.fromJsObject(interop.ResizeObserver jsObject)
      : super.fromJsObject(jsObject);

  final StreamController<ResizeObserverEntry> _streamController =
      StreamController<ResizeObserverEntry>();

  @override
  Stream<ResizeObserverEntry> get onResize => _streamController.stream;

  @override
  void observe(Element element) {
    jsObject.observe((element as ElementImpl).jsObject);
  }

  @override
  void unobserve(Element element) {
    jsObject.unobserve((element as ElementImpl).jsObject);
  }

  @override
  void disconnect() {
    jsObject.disconnect();
  }

  static void _resizeCallback(
    List<interop.ResizeObserverEntry> entries,
    interop.ResizeObserver observer,
  ) {
    final dartObserver = observer.dartObject as ResizeObserverImpl;

    for (final entry in entries) {
      dartObserver._streamController.add(ResizeObserverEntryImpl(
        safeElementFromJsObject<Element>(entry.target),
        ImmutableRectangleImpl.safeFromJsObject(entry.contentRect),
      ));
    }
  }
}

/// Browser implementation of [ResizeObserverEntryImpl].
class ResizeObserverEntryImpl implements ResizeObserverEntry {
  /// Create an instance of [ResizeObserverEntryImpl].
  ResizeObserverEntryImpl(this.target, this.contentRect);

  @override
  final Element target;

  @override
  final ImmutableRectangle contentRect;
}
