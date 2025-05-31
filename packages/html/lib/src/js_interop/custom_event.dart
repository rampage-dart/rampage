// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'custom_event_init.dart';
import 'event.dart';

extension type CustomEvent._(JSObject _) implements JSObject, Event {
  external factory CustomEvent(String type, [CustomEventInit eventInitDict]);

  external JSAny get detail;
}
