// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:meta/meta.dart';

import 'html_element.dart';
import 'js_interop/body_element.dart' as js;

final class BodyElement extends HtmlElement<js.HTMLBodyElement> {
  @protected
  BodyElement.fromJsObject(super.jsObject) : super.fromJsObject();
}
