// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'event.dart';
import 'window.dart';

/// Represents simple user interface events.
abstract class UIEvent extends Event {
  /// The view that generated the event.
  Window? get view;

  /// Additional data about the event.
  int get detail;
}
