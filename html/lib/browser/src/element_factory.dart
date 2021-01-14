// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

/// Creates an [Element] from the given [tagName].
Element createElement(String tag) =>
    throw UnimplementedError('createElement not implemented');

/// Calls `document.createElement` to create a [JsObject] that represents a
/// `HTMLElement`.
JsObject createElementJsObject(String tag) =>
    throw UnimplementedError('createElementJsObject not implemented');
