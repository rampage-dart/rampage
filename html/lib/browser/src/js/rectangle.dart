// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:js';

extension ImmutableRectangleJsObject on JsObject {
  static JsFunction _constructor() => context['DOMRectReadOnly'] as JsFunction;

  static JsObject construct(double x, double y, double width, double height) =>
      JsObject(
        _constructor(),
        <Object?>[x, y, width, height],
      );

  bool get isInstanceOf => instanceof(_constructor());

  double get x => this['x'] as double;
  double get y => this['y'] as double;
  double get width => this['width'] as double;
  double get height => this['height'] as double;
  double get top => this['top'] as double;
  double get right => this['right'] as double;
  double get bottom => this['bottom'] as double;
  double get left => this['left'] as double;
}
