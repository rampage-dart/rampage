// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

extension type IntersectionObserverInit._(JSObject _) implements JSObject {
  external factory IntersectionObserverInit({
    JSAny? root,
    String rootMargin,
    String scrollMargin,
    JSAny threshold,
  });

  external JSAny? get root;
  external set root(JSAny? value);
  external String get rootMargin;
  external set rootMargin(String value);
  external String get scrollMargin;
  external set scrollMargin(String value);
  external JSAny get threshold;
  external set threshold(JSAny value);
}
