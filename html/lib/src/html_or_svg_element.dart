// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'element.dart';

/// Describes several features common to the [HtmlElement], and [SvgElement]
/// interfaces.
abstract class HtmlOrSvgElement implements Element {
  /// Sets `focus` on the specified element, if it can be focused.
  ///
  /// The focused element is the element which will receive keyboard and
  /// similar events by default.
  void focus({bool preventScroll = false});

  /// Removes keyboard `focus` from the current element.
  void blur();
}
