// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_html/html.dart';

import 'js/slotable.dart';
import 'node.dart';
import 'slot_element.dart';

/// Browser implementation of [Slotable].
mixin SlotableImpl on NodeImpl implements Slotable {
  @override
  SlotElement? get assignedSlot =>
      safeSlotElementFromObjectNullable(jsObject.assignedSlot);
}
