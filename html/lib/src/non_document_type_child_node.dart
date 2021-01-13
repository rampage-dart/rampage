// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'child_node.dart';
import 'element.dart';

/// Contains methods that are particular to [Node] objects that can have a
/// parent, but not suitable for [DocumentType].
abstract class NonDocumentTypeChildNode implements ChildNode {
  /// Returns the [Element] immediately prior to this node in its parent's
  /// children list, or `null` if there is no [Element] in the list prior to
  /// this node.
  Element? get previousElementSibling;

  /// Returns the [Element] immediately following this node in its parent's
  /// children list, or `null` if there is no [Element] in the list prior to
  /// this node.
  Element? get nextElementSibling;
}
