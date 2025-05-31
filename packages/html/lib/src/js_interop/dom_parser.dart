// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'document.dart';
import 'dom_parser_supported_type.dart';

extension type DOMParser._(JSObject _) implements JSObject {
  external factory DOMParser();

  external Document parseFromString(JSAny string, DOMParserSupportedType type);
}
