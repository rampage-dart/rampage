// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

@JS()
library rampage_browser_interop.src.geometry;

import 'package:js/js.dart';

import 'js_object.dart';

//------------------------------------------------------------------------------
// Rectangle
//------------------------------------------------------------------------------

/// A rectangle whose properties are immutable.
@JS('DOMRectReadOnly')
class ImmutableRectangle extends JsObject {
  /// Creates an [ImmutableRectangle].]
  external factory ImmutableRectangle([
    double x = 0.0,
    double y = 0.0,
    double width = 0.0,
    double height = 0.0,
  ]);

  /// The x coordinate of the origin.
  external double get x;

  /// The y coordinate of the origin.
  external double get y;

  /// The width of the rectangle.
  external double get width;

  /// The height of the rectangle.
  external double get height;

  /// The top coordinate value of the rectangle (usually the same as [y].)
  external double get top;

  /// The right coordinate value of the rectangle (usually the same as [x] +
  /// [width])
  external double get right;

  /// The left coordinate value of the DOMRect (usually the same as [x]).
  external double get left;

  /// The bottom coordinate value of the DOMRect (usually the same as [y] +
  /// [height]).
  external double get bottom;
}

/// A rectanble.
@JS('DOMRect')
class Rectangle extends ImmutableRectangle {
  /// Creates a [Rectangle].
  external factory Rectangle([
    double x = 0.0,
    double y = 0.0,
    double width = 0.0,
    double height = 0.0,
  ]);

  external set x(double value);
  external set y(double value);
  external set width(double value);
  external set height(double value);
}
