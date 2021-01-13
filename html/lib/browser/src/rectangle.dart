// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'wrapper.dart';

/// Browser implementation of [ImmutableRectangle].
class ImmutableRectangleImpl extends JsWrapper implements ImmutableRectangle {
  /// Create an instance of [ImmutableRectangleImpl].
  factory ImmutableRectangleImpl({
    double x = 0.0,
    double y = 0.0,
    double width = 0.0,
    double height = 0.0,
  }) => throw UnimplementedError('ImmutableRectangleImpl not implemented');

  /// Creates an instance of [ImmutableRectangleImpl] from the [jsObject].
  ImmutableRectangleImpl.fromJsObject(JsObject jsObject)
      : super.fromJsObject(jsObject);

  @override
  double get x => throw UnimplementedError('x not implemented');

  @override
  double get y => throw UnimplementedError('y not implemented');

  @override
  double get width => throw UnimplementedError('width not implemented');

  @override
  double get height => throw UnimplementedError('height not implemented');

  @override
  double get top => throw UnimplementedError('top not implemented');

  @override
  double get right => throw UnimplementedError('right not implemented');

  @override
  double get left => throw UnimplementedError('left not implemented');

  @override
  double get bottom => throw UnimplementedError('bottom not implemented');
}
