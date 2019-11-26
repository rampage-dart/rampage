// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

@JS()
library rampage_browser_interop.src.observer;

import 'package:js/js.dart';
import 'package:rampage_browser_interop/browser_interop.dart';

import 'element.dart';
import 'js_object.dart';

//------------------------------------------------------------------------------
// IntersectionObserver
//------------------------------------------------------------------------------

/// Provides a way to asynchronously observe changes in the intersection of a
/// target [Element] with an ancestor [Element] or with a top-level [Document]'s
/// viewport.
@JS('IntersectionObserver')
class IntersectionObserver extends JsObject {
  /// Creates a new [IntersectionObserver] which will execute the specified
  /// [callback] function when it detects that a target [Element]'s visibility
  /// has crossed one or more thresholds.
  external factory IntersectionObserver(
    IntersectionObserverCallback callback, [
    IntersectionObserverOptions options,
  ]);

  /// A specific ancestor of the target [Element] being observed.
  ///
  /// If no value was passed to the constructor or this is `null`, the
  /// top-level [Document]'s viewport is used.
  external Element get root;

  /// An offset rectangle applied to the [root]'s bounding box when calculating
  /// intersections, effectively shrinking or growing the [root] for calculation
  /// purposes.
  external String get rootMargin;

  /// A list of thresholds, sorted in increasing numeric order, where each
  /// threshold is a ratio of intersection area to bounding box area of an
  /// observed target.
  external List<double> get thresholds;

  /// Tells the [IntersectionObserver] a target [element] to observe.
  external void observe(Element element);

  /// Tells the [IntersectionObserver] to stop observing a particular target
  /// [element].
  external void unobserve(Element element);

  /// Stops the [IntersectionObserver] from observing any target.
  external void disconnect();
}

/// A function which is called when the percentage of the target [Element] is
/// visible crosses a threshold.
typedef IntersectionObserverCallback = Function(
  List<IntersectionObserverEntry> entries,
  IntersectionObserver observer,
);

/// Describes the intersection between the target [Element] and its root
/// container at a specific moment of transition.
@JS()
@anonymous
class IntersectionObserverEntry {
  /// The bounds rectangle of the [target] element.
  external ImmutableRectangle get boundingClientRect;

  /// The ratio of the [intersectionRect] to the [boundingClientRect].
  external double get intersectionRatio;

  /// Represents the [target]'s visible area.
  external ImmutableRectangle get intersectionRect;

  /// Returns `true` if the [target] element intersects with the intersection
  /// observer's root.
  ///
  /// If this is `true`, then, the [IntersectionObserverEntry] describes a
  /// transition into a state of intersection; if it's `false`, then you know
  /// the transition is from intersecting to not-intersecting.
  external bool get isIntersecting;

  /// The bounds rectangle for intersection observer's root.
  external ImmutableRectangle get rootBounds;

  /// The Element whose intersection with the root changed.
  external Element get target;

  /// The time at which the intersection was recorded, relative to the
  /// [IntersectionObserver]'s time origin.
  external double get time;
}

/// Object allowing you to set options for the [IntersectionObserver].
@JS()
@anonymous
class IntersectionObserverOptions {
  /// Creates the [IntersectionObserverOptions].
  external factory IntersectionObserverOptions({
    Element root,
    String rootMargin = '0px',
    List<double> threshold = const [0.0],
  });

  /// An [Element] which is an ancestor of the intended target, whose bounding
  /// rectangle will be considered the viewport.
  ///
  /// Any part of the target not visible in the visible area of the root is not
  /// considered visible.
  external Element get root;
  external set root(Element value);

  /// A string which specifies a set of offsets to add to the root's bounding
  /// box when calculating intersections, effectively shrinking or growing the
  /// root for calculation purposes.
  external String get rootMargin;
  external set rootMargin(String value);

  /// A list of numbers between 0.0 and 1.0, specifying a ratio of intersection
  /// area to total bounding box area for the observed target.
  ///
  /// A value of 0.0 means that even a single visible pixel counts as the target
  /// being visible.
  external List<double> get threshold;
  external set threshold(List<double> value);
}

//------------------------------------------------------------------------------
// ResizeObserver
//------------------------------------------------------------------------------

/// The [ResizeObserver] interface reports changes to the dimensions of an
/// [Element]'s content or border box.
@JS('ResizeObserver')
class ResizeObserver extends JsObject {
  /// Crreates a new [ResizeObserver].
  external factory ResizeObserver(ResizeObserverCallback callback);

  /// Initiates the observing of a specified [Element].
  external void observe(Element element, [ResizeObserverOptions options]);

  /// Ends the observing of a specified [Element].
  external void unobserve(Element element);

  /// Unobserves all observed [Element] targets of a particular observer.
  external void disconnect();
}

/// The function called whenever an observed resize occurs.
typedef ResizeObserverCallback = void Function(
  List<ResizeObserverEntry> entries,
  ResizeObserver observer,
);

/// The object passed to the [ResizeObserver]s callback function, which allows
/// you to access the new dimensions of the [Element] being observed.
@JS('ResizeObserverEntry')
class ResizeObserverEntry {
  /// A reference to the [Element] being observed.
  external Element get target;

  /// The new size of the observed [Element] when the callback is run.
  external ImmutableRectangle get contentRect;
}

/// The new content box size of the observed [Element].
@JS()
@anonymous
class ResizeObserverSize {
  /// The length of the observed [Element]'s border box in the inline dimension.
  external double get inlineSize;

  /// The length of the observed [Element]'s border box in the block dimension
  external double get blockSize;
}

/// Object allowing you to set options for the [ResizeObserver].
@JS()
@anonymous
class ResizeObserverOptions {
  /// Creates the [ResizeObserverOptions].
  external factory ResizeObserverOptions({String box = 'content-box'});

  /// The box model the observer will observe changes to.
  external String get box;
  external set box(String value);
}
