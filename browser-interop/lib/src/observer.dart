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

/// Object allowing you to set options for the observation.
@JS()
@anonymous
class ResizeObserverOptions {
  /// Creates the [ResizeObserverOptions].
  external factory ResizeObserverOptions({String box = 'content-box'});

  /// The box model the observer will observe changes to.
  external String get box;
  external set box(String value);
}
