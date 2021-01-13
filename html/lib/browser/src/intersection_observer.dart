// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:async';
import 'dart:js';

import 'package:rampage_html/html.dart';

import 'wrapper.dart';

/// Browser implementation of [IntersectionObserver].
class IntersectionObserverImpl extends JsWrapper
    implements IntersectionObserver {
  /// Creates an instance of [IntersectionObserverImpl].
  factory IntersectionObserverImpl({
    Element? root,
    String rootMargin = '0px',
    List<double> threshold = const [0.0],
  }) =>
      throw UnimplementedError();

  /// Creates an instance of [IntersectionObserverImpl] from the [jsObject].
  IntersectionObserverImpl.fromJsObject(JsObject jsObject)
      : super.fromJsObject(jsObject);

  @override
  Stream<IntersectionObserverEntry> get onIntersection =>
      throw UnimplementedError('onIntersection not implemented');

  @override
  Element? get root => throw UnimplementedError('root not implemented');

  @override
  String get rootMargin =>
      throw UnimplementedError('rootMargin not implemented');

  @override
  List<double> get thresholds =>
      throw UnimplementedError('thresholds not implemented');

  @override
  void observe(Element element) =>
      throw UnimplementedError('observe not implemented');

  @override
  void unobserve(Element element) =>
      throw UnimplementedError('unobserve not implemented');

  @override
  void disconnect() => throw UnimplementedError('disconnect not implemented');
}

/// Describes the intersection between the target [Element] and its root
/// container at a specific moment of transition.
class IntersectionObserverEntryImpl extends JsWrapper
    implements IntersectionObserverEntry {
  /// Creates an instance of [IntersectionObserverEntryImpl] from the
  /// [jsObject].
  IntersectionObserverEntryImpl.fromJsObject(JsObject jsObject)
      : super.fromJsObject(jsObject);

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
  Element get target => throw UnimplementedError('target not implemented');

  @override
  double get time => throw UnimplementedError('time not implemented');
}
