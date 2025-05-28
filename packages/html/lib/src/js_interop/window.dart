// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'document.dart';
import 'event_target.dart';

extension type Window._(JSObject _) implements JSObject, EventTarget {
  external Document get document;
}

@JS()
external Window get window;
