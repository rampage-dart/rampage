// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:async';
import 'dart:js';

import 'package:rampage_html/html.dart';

import 'element.dart';
import 'element_from_js_object.dart';
import 'js/intersection_observer.dart';
import 'js/intersection_observer_entry.dart';
import 'js/intersection_observer_options.dart';
import 'observer_stream.dart';
import 'wrapper.dart';

/// Browser implementation of [IntersectionObserver].
class IntersectionObserverImpl extends DartJsWrapper
    with ObserverImpl
    implements IntersectionObserver {
  /// Creates an instance of [IntersectionObserverImpl].
  factory IntersectionObserverImpl({
    Element? root,
    String rootMargin = '0px',
    List<double> threshold = const [0.0],
  }) =>
      IntersectionObserverImpl.fromJsObject(
        IntersectionObserverJsObject.construct(
          JsFunction.withThis(_intersectionCallback),
          IntersectionObserverInitJsObject.construct(
            root: (root as ElementImpl?)?.jsObject,
            rootMargin: rootMargin,
            threshold: threshold,
          ),
        ),
      );

  /// Creates an instance of [IntersectionObserverImpl] from the [jsObject].
  IntersectionObserverImpl.fromJsObject(super.jsObject) : super.fromJsObject();

  // ignore: close_sinks
  late final StreamController<IntersectionObserverEntryImpl> _streamController =
      StreamController<IntersectionObserverEntryImpl>.broadcast(
    onCancel: disconnect,
  );

  @override
  late final ObserverStream<IntersectionObserverEntry> onIntersection =
      ObserverStreamImpl<IntersectionObserverImpl,
          IntersectionObserverEntryImpl>(_streamController.stream, this);

  @override
  Element? get root => throw UnimplementedError('root not implemented');

  @override
  String get rootMargin =>
      throw UnimplementedError('rootMargin not implemented');

  @override
  List<double> get thresholds =>
      throw UnimplementedError('thresholds not implemented');

  @override
  void disconnect() {
    jsObject.disconnect();
  }

  static void _intersectionCallback(
    Object? scope,
    List<Object?> entries,
    JsObject observer,
  ) {
    final dartObserver = observer.dartObject! as IntersectionObserverImpl;

    for (final entry in entries) {
      dartObserver._streamController.add(
        IntersectionObserverEntryImpl.fromJsObject(
          JsObject.fromBrowserObject(entry!),
        ),
      );
    }
  }
}

/// Describes the intersection between the target [Element] and its root
/// container at a specific moment of transition.
class IntersectionObserverEntryImpl extends JsWrapper
    implements ObserverEntry, IntersectionObserverEntry {
  /// Creates an instance of [IntersectionObserverEntryImpl] from the
  /// [jsObject].
  IntersectionObserverEntryImpl.fromJsObject(super.jsObject)
      : super.fromJsObject();

  @override
  ImmutableRectangle get boundingClientRect =>
      throw UnimplementedError('boundingClientRect not implemented');

  @override
  double get intersectionRatio =>
      throw UnimplementedError('intersectionRatio not implemented');

  @override
  ImmutableRectangle get intersectionRect =>
      throw UnimplementedError('intersectionRect not implemented');

  @override
  bool get isIntersecting =>
      throw UnimplementedError('isIntersecting not implemented');

  @override
  ImmutableRectangle? get rootBounds =>
      throw UnimplementedError('rootBounds not implemented');

  @override
  Element get target => safeElementFromObject(jsObject.target);

  @override
  double get time => jsObject.time;

  @override
  bool isTarget(Element element) => target == element;
}
