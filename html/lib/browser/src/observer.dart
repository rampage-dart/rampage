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
// IntersectionObserver
//------------------------------------------------------------------------------

/// Browser implementation of [IntersectionObserver].
class IntersectionObserverImpl extends JsWrapper<interop.IntersectionObserver>
    implements IntersectionObserver {
  /// Creates an instance of [IntersectionObserverImpl].
  factory IntersectionObserverImpl([IntersectionObserverOptions options]) =>
      IntersectionObserverImpl.fromJsObject(
        interop.IntersectionObserver(
            _intersectionCallback,
            (options as IntersectionObserverOptionsImpl)?.jsObject ??
                interop.IntersectionObserverOptions()),
      );

  /// Creates an instance of [IntersectionObserverImpl] from the [jsObject].
  IntersectionObserverImpl.fromJsObject(interop.IntersectionObserver jsObject)
      : super.fromJsObject(jsObject);

  final StreamController<IntersectionObserverEntry> _streamController =
      StreamController<IntersectionObserverEntry>();

  @override
  Stream<IntersectionObserverEntry> get onIntersection =>
      _streamController.stream;

  @override
  Element get root => safeElementFromJsObject(jsObject.root);

  @override
  String get rootMargin => jsObject.rootMargin;

  @override
  List<double> get thresholds => jsObject.thresholds;

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

  static void _intersectionCallback(
    List<interop.IntersectionObserverEntry> entries,
    interop.IntersectionObserver observer,
  ) {
    final dartObserver = observer.dartObject as IntersectionObserverImpl;

    for (final entry in entries) {
      dartObserver._streamController
          .add(IntersectionObserverEntryImpl.fromJsObject(entry));
    }
  }
}

/// Describes the intersection between the target [Element] and its root
/// container at a specific moment of transition.
class IntersectionObserverEntryImpl implements IntersectionObserverEntry {
  /// Creates an instance of [IntersectionObserverEntryImpl] from the
  /// [jsObject].
  IntersectionObserverEntryImpl.fromJsObject(this.jsObject);

  /// The JavaScript object being wrapped.
  final interop.IntersectionObserverEntry jsObject;

  @override
  ImmutableRectangle get boundingClientRect =>
      ImmutableRectangleImpl.safeFromJsObject(jsObject.boundingClientRect);

  @override
  double get intersectionRatio => jsObject.intersectionRatio;

  @override
  ImmutableRectangle get intersectionRect =>
      ImmutableRectangleImpl.safeFromJsObject(jsObject.intersectionRect);

  @override
  bool get isIntersecting => jsObject.isIntersecting;

  @override
  ImmutableRectangle get rootBounds =>
      ImmutableRectangleImpl.safeFromJsObject(jsObject.rootBounds);

  @override
  Element get target => safeElementFromJsObject<Element>(jsObject.target);

  @override
  double get time => jsObject.time;
}

/// Browser implementation of [IntersectionObserverOptions].
class IntersectionObserverOptionsImpl implements IntersectionObserverOptions {
  /// Creates an instance of [IntersectionObserverOptionsImpl].
  factory IntersectionObserverOptionsImpl({
    Element root,
    String rootMargin = '0px',
    List<double> threshold = const [0.0],
  }) =>
      IntersectionObserverOptionsImpl.fromJsObject(
        interop.IntersectionObserverOptions(
          root: (root as ElementImpl)?.jsObject,
          rootMargin: rootMargin,
          threshold: threshold,
        ),
      );

  /// Creates an instance of [IntersectionObserverOptionsImpl] from the
  /// [jsObject].
  IntersectionObserverOptionsImpl.fromJsObject(this.jsObject);

  /// The JavaScript object being wrapped.
  final interop.IntersectionObserverOptions jsObject;

  @override
  Element get root => safeElementFromJsObject<Element>(jsObject.root);
  @override
  set root(Element value) {
    jsObject.root = (value as ElementImpl).jsObject;
  }

  @override
  String get rootMargin => jsObject.rootMargin;
  set rootMargin(String value) {
    jsObject.rootMargin = value;
  }

  @override
  List<double> get threshold => jsObject.threshold;
  @override
  set threshold(List<double> value) {
    jsObject.threshold = value;
  }
}

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
