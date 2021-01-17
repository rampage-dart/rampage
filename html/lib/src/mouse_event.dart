// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'event_target.dart';
import 'ui_event.dart';

/// represents events that occur due to the user interacting with a pointing
/// device (such as a mouse).
///
/// Common events using this interface include `click`, `dblclick`, `mouseup`,
/// `mousedown`.
abstract class MouseEvent extends UIEvent {
  /// The X coordinate of the mouse pointer in global (screen) coordinates.
  int get screenX;

  /// The Y coordinate of the mouse pointer in global (screen) coordinates.
  int get screenY;

  /// The X coordinate of the mouse pointer in local (DOM content) coordinates.
  int get clientX;

  /// The Y coordinate of the mouse pointer in local (DOM content) coordinates.
  int get clientY;

  /// Whether the `control` key was down when the mouse event was fired.
  bool get ctrlKey;

  /// Whether the `shift` key was down when the mouse event was fired.
  bool get shiftKey;

  /// Whether the `alt` key was down when the mouse event was fired.
  bool get altKey;

  /// Whether the `meta` key was down when the mouse event was fired.
  bool get metaKey;

  /// The button number that was pressed (if applicable) when the mouse event
  /// was fired.
  int get button;

  /// The secondary target for the event, if there is one.
  EventTarget? get relatedTarget;
}
