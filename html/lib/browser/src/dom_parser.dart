// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_html/html.dart';

import 'document.dart';
import 'js/dom_parser.dart';
import 'wrapper.dart';

/// Browser implementation of [DivElement].
class DomParserImpl extends JsWrapper implements DomParser {
  /// Create an instance of [DomParserImpl].
  factory DomParserImpl() =>
      DomParserImpl.fromJsObject(DomParserJsObject.construct());

  /// Create an instance of [DomParserImpl] from the [jsObject].
  DomParserImpl.fromJsObject(super.jsObject) : super.fromJsObject();

  @override
  Document parseFromString(String string, String type) =>
      DocumentImpl.fromJsObject(jsObject.parseFromString(string, type));
}
