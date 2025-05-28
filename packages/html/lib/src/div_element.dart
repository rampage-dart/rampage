// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:meta/meta.dart';

import 'html_element.dart';
import 'js_interop/div_element.dart' as js;

final class DivElement extends HtmlElement<js.HTMLDivElement> {
  @protected
  DivElement.fromJsObject(super.jsObject) : super.fromJsObject();
}
