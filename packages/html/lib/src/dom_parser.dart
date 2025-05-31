// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'document.dart';
import 'dom_parser_supported_type.dart';
import 'js_interop/dom_parser.dart' as js;
import 'wrapper.dart';

final class DomParser extends JsWrapper<js.DOMParser> {
  factory DomParser() => DomParser.fromJsObject(js.DOMParser());

  DomParser.fromJsObject(super.jsObject) : super.fromJsObject();

  Document parseFromString(String string, DomParserSupportedType type) =>
      Document.fromJsObject(jsObject.parseFromString(string.toJS, type.toJS));
}
