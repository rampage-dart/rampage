// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_html/html.dart';

import 'node.dart';

/// Browser implementation of [Slotable].
mixin SlotableImpl on NodeImpl implements Slotable {
  @override
  SlotElement? get assignedSlot =>
      throw UnimplementedError('assignedSlot not implemented');
}
