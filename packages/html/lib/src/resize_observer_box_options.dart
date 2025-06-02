// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:meta/meta.dart';

enum ResizeObserverBoxOptions {
  borderBox('border-box'),
  contentBox('content-box'),
  devicePixelContentBox('device-pixel-content-box');

  const ResizeObserverBoxOptions(this.toJS);

  final String toJS;
}

@internal
extension ResizeObserverBoxOptionsDartObject on String {
  ResizeObserverBoxOptions get toDart => switch (this) {
    'border-box' => ResizeObserverBoxOptions.borderBox,
    'content-box' => ResizeObserverBoxOptions.contentBox,
    'device-pixel-content-box' =>
      ResizeObserverBoxOptions.devicePixelContentBox,
    _ => throw UnsupportedError(
      '$this is not a member of ResizeObserverBoxOptions',
    ),
  };
}
