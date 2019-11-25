// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:async';

import 'package:rampage_html/browser/html.dart' as impl;
import 'package:rampage_html/html.dart';

import 'element.dart';
import 'geometry.dart';

//------------------------------------------------------------------------------
// IntersectionObserver
//------------------------------------------------------------------------------

/// Provides a way to asynchronously observe changes in the intersection of a
/// target [Element] with an ancestor [Element] or with a top-level [Document]'s
/// viewport.
abstract class IntersectionObserver {
  /// Creates a new [IntersectionObserver] which will generate events to a
  /// stream when it detects that a target [Element]'s visibility has crossed
  /// one or more thresholds.
  factory IntersectionObserver([IntersectionObserverOptions options]) =
      impl.IntersectionObserverImpl;

  ///
  Stream<IntersectionObserverEntry> get onIntersection;

  /// A specific ancestor of the target [Element] being observed.
  ///
  /// If no value was passed to the constructor or this is `null`, the
  /// top-level [Document]'s viewport is used.
  Element get root;

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
  ImmutableRectangle get rootBounds;

  /// The Element whose intersection with the root changed.
  Element get target;

  /// The time at which the intersection was recorded, relative to the
  /// [IntersectionObserver]'s time origin.
  double get time;
}

/// Object allowing you to set options for the [IntersectionObserver].
abstract class IntersectionObserverOptions {
  /// Creates the [IntersectionObserverOptions].
  factory IntersectionObserverOptions({
    Element root,
    String rootMargin,
    List<double> threshold,
  }) = impl.IntersectionObserverOptionsImpl;

  /// An [Element] which is an ancestor of the intended target, whose bounding
  /// rectangle will be considered the viewport.
  ///
  /// Any part of the target not visible in the visible area of the root is not
  /// considered visible.
  Element get root;
  set root(Element value);

  /// A string which specifies a set of offsets to add to the root's bounding
  /// box when calculating intersections, effectively shrinking or growing the
  /// root for calculation purposes.
  String get rootMargin;

  /// A list of numbers between 0.0 and 1.0, specifying a ratio of intersection
  /// area to total bounding box area for the observed target.
  ///
  /// A value of 0.0 means that even a single visible pixel counts as the target
  /// being visible.
  List<double> get threshold;
  set threshold(List<double> value);
}

//------------------------------------------------------------------------------
// ResizeObserver
//------------------------------------------------------------------------------

/// The [ResizeObserver] interface reports changes to the dimensions of an
/// [Element]'s content or border box.
abstract class ResizeObserver {
  /// Creates an instance of [ResizeObserver].
  factory ResizeObserver() = impl.ResizeObserverImpl;

  Stream<ResizeObserverEntry> get onResize;

  /// Initiates the observing of a specified [Element].
  void observe(Element element);

  /// Ends the observing of a specified [Element].
  void unobserve(Element element);

  /// Unobserves all observed [Element] targets of a particular observer.
  void disconnect();
}

/// The object passed to the [ResizeObserver]s callback function, which allows
/// you to access the new dimensions of the [Element] being observed.
abstract class ResizeObserverEntry {
  /// A reference to the [Element] being observed.
  Element get target;

  /// The new size of the observed [Element] when the callback is run.
  ImmutableRectangle get contentRect;
}
