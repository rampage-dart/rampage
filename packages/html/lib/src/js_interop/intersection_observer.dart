// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'element.dart';
import 'intersection_observer_callback.dart';
import 'intersection_observer_entry.dart';
import 'intersection_observer_init.dart';

extension type IntersectionObserver._(JSObject _) implements JSObject {
  external factory IntersectionObserver(
    IntersectionObserverCallback callback, [
    IntersectionObserverInit options,
  ]);

  external JSAny get root;
  external String get rootMargin;
  external String get scrollMargin;
  external JSArray<JSNumber> get thresholds;
  external void observe(Element target);
  external void unobserve(Element target);
  external void disconnect();
  external JSArray<IntersectionObserverEntry> takeRecords();
}
