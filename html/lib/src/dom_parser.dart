// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_html/browser/html.dart' as impl;

import 'document.dart';

/// Parses XML or HTML source code from a string into a DOM [Document].
abstract class DomParser {
  /// Creates a new [DomParser].
  factory DomParser() = impl.DomParserImpl;

  /// Parses the [string] into a DOM [Document].
  Document parseFromString(String string, String type);
}
