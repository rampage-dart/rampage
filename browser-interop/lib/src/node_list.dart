// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

@JS()
library rampage_browser_interop.src.node_list;

import 'package:js/js.dart';

import 'node.dart';

/// A collections of [Node]s, usually returned by properties such as
/// [Node.childNodes] and [Document.querySelectorAll].
///
/// In some cases, the [NodeList] is live, which means that changes in the DOM
/// automatically update the collection. For example, [Node.childNodes] is live.
///
/// In other cases, the [NodeList] is static, where any changes in the DOM does
/// not affect the content of the collection. [Document.querySelectorAll]
/// returns a static [NodeList].
@JS('NodeList')
class NodeList {
  /// The number of nodes in the [NodeList].
  external int get length;

  /// Returns an item in the list by its [index], or `null` if the [index] is
  /// out-of-bounds.
  external Node item(int index);
}
