// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_html/browser/html.dart' as impl;

import 'event.dart';

/// The [CustomEvent] interface represents events initialized by an application
/// for any purpose.
abstract class CustomEvent implements Event {
  /// Creates a [CustomEvent] with the given [type].
  factory CustomEvent(
    String type, {
    bool bubbles,
    bool cancelable,
    bool composed,
    dynamic detail,
  }) = impl.CustomEventImpl;

  /// Any data passed when initializing the event.
  dynamic get detail;
}
