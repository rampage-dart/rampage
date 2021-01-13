// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'element.dart';
import 'node.dart';

/// The [Slotable] interface defines features that allow nodes to become the
/// contents of a `<slot>` element - the following features are included in both
/// [Element] and [Text].
abstract class Slotable implements Node {
  /// Returns the `<slot>` the [Node] is inserted in.
  SlotElement? get assignedSlot;
}
