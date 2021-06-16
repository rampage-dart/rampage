// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_html/browser/html.dart' as impl;

import 'html_element.dart';

/// The [StyleElement] interface represents a `<div>` element.
abstract class StyleElement implements HtmlElement {
  /// Creates a new [StyleElement].
  factory StyleElement() = impl.StyleElementImpl;

  /// The intended destination medium for style information.
  String get media;
  set media(String value);
}
