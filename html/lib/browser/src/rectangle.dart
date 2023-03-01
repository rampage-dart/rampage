// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_html/html.dart';

import 'js/rectangle.dart';
import 'wrapper.dart';

/// Browser implementation of [ImmutableRectangle].
class ImmutableRectangleImpl extends JsWrapper implements ImmutableRectangle {
  /// Create an instance of [ImmutableRectangleImpl].
  factory ImmutableRectangleImpl({
    double x = 0.0,
    double y = 0.0,
    double width = 0.0,
    double height = 0.0,
  }) =>
      ImmutableRectangleImpl.fromJsObject(
        ImmutableRectangleJsObject.construct(
          x,
          y,
          width,
          height,
        ),
      );

  /// Creates an instance of [ImmutableRectangleImpl] from the [jsObject].
  ImmutableRectangleImpl.fromJsObject(super.jsObject) : super.fromJsObject();

  @override
  double get x => jsObject.x;

  @override
  double get y => jsObject.y;

  @override
  double get width => jsObject.width;

  @override
  double get height => jsObject.height;

  @override
  double get top => jsObject.top;

  @override
  double get right => jsObject.right;

  @override
  double get left => jsObject.left;

  @override
  double get bottom => jsObject.bottom;
}
