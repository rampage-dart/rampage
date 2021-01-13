// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_html/browser/html.dart' as impl;

import 'html_element.dart';

/// The [DivElement] interface represents a `<div>` element.
abstract class DivElement implements HtmlElement {
  /// Creates a new [DivElement].
  factory DivElement() = impl.DivElementImpl;
}
