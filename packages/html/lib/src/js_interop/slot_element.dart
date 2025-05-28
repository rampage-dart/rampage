// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'html_element.dart';

extension type HTMLSlotElement._(JSObject _) implements JSObject, HTMLElement {
  external factory HTMLSlotElement();

  external String get name;
  external set name(String value);
}
