// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'wrapper.dart';

/// Browser implementation of [DivElement].
class DomParserImpl extends JsWrapper implements DomParser {
  /// Create an instance of [DomParserImpl].
  factory DomParserImpl() =>
      throw UnimplementedError('DomParser not implemented');

  /// Create an instance of [DomParserImpl] from the [jsObject].
  DomParserImpl.fromJsObject(JsObject jsObject) : super.fromJsObject(jsObject);

  @override
  Document parseFromString(String string, String type) =>
      throw UnimplementedError('parseFromString not implemented');
}
