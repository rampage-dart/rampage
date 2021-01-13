// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'element.dart';
import 'node.dart';
import 'non_element_parent_node.dart';
import 'parent_node.dart';

//-----------------------------------------------------------
// Document
//-----------------------------------------------------------

/// The [Document] interface represents any web page loaded in the browser and
/// serves as an entry point into the web page's content, which is the DOM tree.
abstract class Document implements Node, ParentNode, NonElementParentNode {
  /// Represents the `<body>` of the current [Document], or `null` if no such
  /// [Element] exists.
  BodyElement get body;
}
