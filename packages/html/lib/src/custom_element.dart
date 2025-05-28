// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:meta/meta.dart';

import 'html_element.dart';

class CustomElement extends HtmlElement {
  @protected
  CustomElement.fromJsObject(super.jsObject) : super.fromJsObject();

  void connected() {}

  void disconnected() {}

  void attributeChanged(String name, String? oldValue, String? newValue) {}
}
