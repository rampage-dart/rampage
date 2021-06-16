// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:async';

import 'package:rampage_html/browser/html.dart' as impl;

import 'element.dart';
import 'rectangle.dart';

/// The [ResizeObserver] interface reports changes to the dimensions of an
/// [Element]'s content or border box.
abstract class ResizeObserver {
  /// Creates an instance of [ResizeObserver].
  factory ResizeObserver() = impl.ResizeObserverImpl;

  /// Stream of resize events observed.
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
