// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_html/html.dart';

/// Browser implementation of [HtmlOrSvgElement].
mixin HtmlOrSvgElementImpl on Element implements HtmlOrSvgElement {
  @override
  void focus({bool preventScroll = false}) =>
      throw UnimplementedError('focus not implemented');

  @override
  void blur() => throw UnimplementedError('blur not implemented');
}
