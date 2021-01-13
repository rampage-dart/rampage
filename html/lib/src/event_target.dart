// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:async';

import 'event.dart';

/// [EventTarget] is a DOM interface implemented by objects that can receive
/// events and may have listeners for them.
abstract class EventTarget {
  /// [Event] streams for the target.
  ///
  /// Subscribe to a [Stream] by accessing it through the corresponding
  /// [Event.type].
  Map<String, Stream<Event>> get on;

  /// Dispatches an [Event] to this [EventTarget].
  bool dispatchEvent(Event event);
}
