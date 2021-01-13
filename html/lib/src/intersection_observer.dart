// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:async';

import 'package:rampage_html/browser/html.dart' as impl;

import 'element.dart';
import 'rectangle.dart';

/// Provides a way to asynchronously observe changes in the intersection of a
/// target [Element] with an ancestor [Element] or with a top-level [Document]'s
/// viewport.
abstract class IntersectionObserver {
  /// Creates a new [IntersectionObserver] which will generate events to a
  /// stream when it detects that a target [Element]'s visibility has crossed
  /// one or more thresholds.
  factory IntersectionObserver({
    Element? root,
    String rootMargin,
    List<double> threshold,
  }) = impl.IntersectionObserverImpl;

  ///
  Stream<IntersectionObserverEntry> get onIntersection;

  /// A specific ancestor of the target [Element] being observed.
  ///
  /// If no value was passed to the constructor or this is `null`, the
  /// top-level [Document]'s viewport is used.
  Element? get root;

  /// An offset rectangle applied to the [root]'s bounding box when calculating
  /// intersections, effectively shrinking or growing the [root] for calculation
  /// purposes.
  String get rootMargin;

  /// A list of thresholds, sorted in increasing numeric order, where each
  /// threshold is a ratio of intersection area to bounding box area of an
  /// observed target.
  List<double> get thresholds;

  /// Tells the [IntersectionObserver] a target [element] to observe.
  void observe(Element element);

  /// Tells the [IntersectionObserver] to stop observing a particular target
  /// [element].
  void unobserve(Element element);

  /// Stops the [IntersectionObserver] from observing any target.
  void disconnect();
}

/// Describes the intersection between the target [Element] and its root
/// container at a specific moment of transition.
abstract class IntersectionObserverEntry {
  /// The bounds rectangle of the [target] element.
  ImmutableRectangle get boundingClientRect;

  /// The ratio of the [intersectionRect] to the [boundingClientRect].
  double get intersectionRatio;

  /// Represents the [target]'s visible area.
  ImmutableRectangle get intersectionRect;

  /// Returns `true` if the [target] element intersects with the intersection
  /// observer's root.
  ///
  /// If this is `true`, then, the [IntersectionObserverEntry] describes a
  /// transition into a state of intersection; if it's `false`, then you know
  /// the transition is from intersecting to not-intersecting.
  bool get isIntersecting;

  /// The bounds rectangle for intersection observer's root.
  ImmutableRectangle? get rootBounds;

  /// The Element whose intersection with the root changed.
  Element get target;

  /// The time at which the intersection was recorded, relative to the
  /// [IntersectionObserver]'s time origin.
  double get time;
}
