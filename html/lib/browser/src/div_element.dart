// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_html/html.dart';

import 'element_factory.dart';
import 'element_tag.dart';
import 'html_element.dart';

/// Browser implementation of [DivElement].
class DivElementImpl extends HtmlElementImpl implements DivElement {
  /// Create an instance of [DivElementImpl].
  factory DivElementImpl() =>
      DivElementImpl.fromJsObject(createElementJsObject(ElementTag.div));

  /// Create an instance of [DivElementImpl] from the [jsObject]
  DivElementImpl.fromJsObject(super.jsObject) : super.fromJsObject();
}
