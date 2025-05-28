// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

typedef CustomElementConstructor = JSFunction;

@JS('CustomElementInterop')
extension type CustomElementRegistry._(JSObject _) implements JSObject {
  external factory CustomElementRegistry();

  external JSFunction get connectedCallback;
  external set connectedCallback(JSFunction value);
  external JSFunction get disconnectedCallback;
  external set disconnectedCallback(JSFunction value);
  external JSFunction get attributeChangedCallback;
  external set attributeChangedCallback(JSFunction value);

  external void define(
    String name,
    CustomElementConstructor constructor,
    JSArray<JSString> attributes,
  );
}
