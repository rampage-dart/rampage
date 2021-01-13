// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'element.dart';
import 'parent_node.dart';

/// A [ParentNode] that is not an [Element].
abstract class NonElementParentNode implements ParentNode {
  /// Returns an [Element] whose [id] property matches the specified string.
  ///
  /// Since element IDs are required to be unique if specified, they're a
  /// useful way to get access to a specific element quickly.
  T? getElementById<T extends Element>(String id);
}
