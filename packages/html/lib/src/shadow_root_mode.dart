// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:meta/meta.dart';

enum ShadowRootMode {
  open('open'),
  closed('closed');

  const ShadowRootMode(this.toJS);

  @internal
  final String toJS;
}

@internal
extension ShadowRootModeDartObject on String {
  ShadowRootMode get toDart => switch (this) {
    'open' => ShadowRootMode.open,
    'closed' => ShadowRootMode.closed,
    _ => throw UnsupportedError('$this is not a member of ShadowRootMode'),
  };
}
