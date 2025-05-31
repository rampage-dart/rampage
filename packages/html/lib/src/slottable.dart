// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'js_interop/slottable.dart' as js;
import 'node.dart';
import 'slot_element.dart';

abstract mixin class Slottable<T extends js.Slottable> implements Node<T> {
  SlotElement? get assignedSlot =>
      safeSlotElementFromJsObjectNullable(jsObject.assignedSlot);
}
