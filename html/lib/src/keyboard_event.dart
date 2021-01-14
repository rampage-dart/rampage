// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'ui_event.dart';

/// A user interaction with the keyboard; each event describes a single
/// interaction between the user and a key (or combination of a key with
/// modifier keys) on the keyboard. The event type (`keydown`, `keypress`, or
/// `keyup`) identifies what kind of keyboard activity occurred.
abstract class KeyboardEvent extends UIEvent {
  /// The value of the key represented by the event.
  String get key;

  /// The code value of the physical key represented by the event.
  ///
  /// This ignores the user's keyboard layout, so that if the user presses the
  /// key at the "Y" position in a QWERTY keyboard layout (near the middle of
  /// the row above the home row), this will always return "KeyY", even if the
  /// user has a QWERTZ keyboard (which would mean the user expects a "Z" and
  /// all the other properties would indicate a "Z") or a Dvorak keyboard
  /// layout (where the user would expect an "F").
  String get code;

  /// Whether the `Ctrl` key was active when the event was generated.
  bool get ctrlKey;

  /// Whether the `Shift` key was active when the event was generated.
  bool get shiftKey;

  /// Whether the `Alt` key was active when the event was generated.
  bool get altKey;

  /// Whether the `Meta` key was active when the event was generated.
  bool get metaKey;

  /// Whether the key is being held down such that it is automatically
  /// repeating.
  bool get repeat;
}
