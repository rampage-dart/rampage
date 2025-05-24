// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'abort_signal.dart';
import 'event_listener_options.dart';

extension type AddEventListenerOptions._(JSObject _)
    implements JSObject, EventListenerOptions {
  external factory AddEventListenerOptions({
    bool capture,
    bool passive,
    bool once,
    AbortSignal signal,
  });

  external bool get passive;
  external set passive(bool value);
  external bool get once;
  external set once(bool value);
  external AbortSignal get signal;
  external set signal(AbortSignal value);
}
