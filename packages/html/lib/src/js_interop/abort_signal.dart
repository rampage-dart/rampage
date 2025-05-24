// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'event_target.dart';

extension type AbortSignal._(JSObject _) implements JSObject, EventTarget {
  external bool get aborted;
  external JSAny get reason;
  external static AbortSignal abort([JSAny reason]);
  external static AbortSignal timeout(int milliseconds);
  external static AbortSignal any(JSArray<AbortSignal> signals);
  external void throwIfAborted();
}
