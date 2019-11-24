// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_browser_interop/browser_interop.dart' as interop;
import 'package:rampage_html/html.dart';

import 'js_wrapper.dart';

//-----------------------------------------------------------
// Rectangle
//-----------------------------------------------------------

/// Browser implementation of [ImmutableRectangle].
class ImmutableRectangleImpl extends JsWrapper<interop.ImmutableRectangle>
    implements ImmutableRectangle {
  /// Create an instance of [ImmutableRectangleImpl].
  factory ImmutableRectangleImpl({
    double x,
    double y,
    double width,
    double height,
  }) =>
      ImmutableRectangleImpl.fromJsObject(
        interop.ImmutableRectangle(x, y, width, height),
      );

  /// Creates an instance of [ImmutableRectangleImpl] from the [jsObject].
  ImmutableRectangleImpl.fromJsObject(interop.ImmutableRectangle jsObject)
      : super.fromJsObject(jsObject);

  /// Create an instance of [ImmutableRectangleImpl] from the [jsObject].
  ///
  /// This constructor should be used when its unclear if the [jsObject] has
  /// already been wrapped.
  factory ImmutableRectangleImpl.safeFromJsObject(
          interop.ImmutableRectangle jsObject) =>
      jsObject.dartObject as ImmutableRectangleImpl ??
      ImmutableRectangleImpl.fromJsObject(jsObject);

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
