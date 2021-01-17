// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'event_target.dart';
import 'ui_event.dart';

/// Represents focus-related events, including `focus`, `blur`, `focusin`, and
/// `focusout`.
abstract class FocusEvent extends UIEvent {
  /// A secondary target for this event.
  ///
  /// In some cases (such as when tabbing in or out a page), this property may
  /// be set to `null` for security reasons.
  EventTarget? get relatedTarget;
}
