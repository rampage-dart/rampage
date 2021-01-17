// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'ui_event.dart';

/// Represents events that occur due to the user moving a mouse wheel or
/// similar input device.
abstract class WheelEvent extends UIEvent {
  /// The horizontal scroll amount.
  double get deltaX;

  /// The vertical scroll amount.
  double get deltaY;

  /// The scroll amount for the z-axis.
  double get deltaZ;
}
