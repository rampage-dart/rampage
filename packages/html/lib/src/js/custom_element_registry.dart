// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

@JS('CustomElementInterop')
extension type CustomElementRegistry._(JSObject _) implements JSObject {
  external factory CustomElementRegistry();

  external void define(
    String name,
    JSFunction construct,
    JSArray<JSString> attributes,
  );

  external JSFunction connectedCallback;
  external JSFunction disconnectedCallback;
  external JSFunction attributeChangedCallback;
}
