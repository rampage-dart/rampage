// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_html/browser/html.dart' as impl;

/// A rectangle whose properties are immutable.
abstract class ImmutableRectangle {
  /// Create an instance of [ImmutableRectangle].
  factory ImmutableRectangle({
    double x,
    double y,
    double width,
    double height,
  }) = impl.ImmutableRectangleImpl;

  /// The x coordinate of the origin.
  double get x;

  /// The y coordinate of the origin.
  double get y;

  /// The width of the rectangle.
  double get width;

  /// The height of the rectangle.
  double get height;

  /// The top coordinate value of the rectangle (usually the same as [y].)
  double get top;

  /// The right coordinate value of the rectangle (usually the same as [x] +
  /// [width])
  double get right;

  /// The left coordinate value of the DOMRect (usually the same as [x]).
  double get left;

  /// The bottom coordinate value of the DOMRect (usually the same as [y] +
  /// [height]).
  double get bottom;
}
