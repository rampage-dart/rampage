// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_html/browser/html.dart' as impl;

import 'html_element.dart';

/// The [BodyElement] interface represents a `<body>` element.
abstract class BodyElement extends HtmlElement {
  /// Creates a new [BodyElement].
  factory BodyElement() = impl.BodyElementImpl;
}
