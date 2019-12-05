// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_browser_interop/browser_interop.dart' as interop;
import 'package:rampage_html/html.dart';

import 'element.dart';
import 'node.dart';

/// Browser implementation of [Slotable].
mixin SlotableImpl<T extends interop.Slotable> on NodeImpl<T>
    implements Slotable {
  @override
  SlotElement get assignedSlot {
    final assignedTo = jsObject.assignedSlot;

    return assignedTo != null
        ? SlotElementImpl.safeFromJsObject(assignedTo)
        : null;
  }
}
