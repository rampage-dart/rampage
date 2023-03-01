// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'html_element.dart';

/// Browser implementation of [CustomElement].
class CustomElementImpl extends HtmlElementImpl implements CustomElement {
  /// Create an instance of [CustomElementImpl] from the [jsObject].
  CustomElementImpl.fromJsObject(super.jsObject) : super.fromJsObject();

  @override
  void connected() {}

  @override
  void disconnected() {}

  @override
  void attributeChanged(String name, String? oldValue, String? newValue) {}
}
