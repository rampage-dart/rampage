// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:meta/meta.dart';

enum SlotAssignmentMode {
  named('named'),
  manual('manual');

  const SlotAssignmentMode(this.toJS);

  @internal
  final String toJS;
}

@internal
extension SlotAssignmentModeDartObject on String {
  SlotAssignmentMode get toDart => switch (this) {
    'named' => SlotAssignmentMode.named,
    'manual' => SlotAssignmentMode.manual,
    _ => throw UnsupportedError('$this is not a member of SlotAssignmentMode'),
  };
}
