// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'html_element.dart';

extension type HTMLImageElement._(JSObject _) implements JSObject, HTMLElement {
  external factory HTMLImageElement();

  external String get alt;
  external set alt(String value);
  external String get src;
  external set src(String value);
  external String get srcset;
  external set srcset(String value);
  external String get sizes;
  external set sizes(String value);
  external String? get crossOrigin;
  external set crossOrigin(String? value);
  external String get useMap;
  external set useMap(String value);
  external bool get isMap;
  external set isMap(bool value);
  external int get width;
  external set width(int value);
  external int get height;
  external set height(int value);
  external int get naturalWidth;
  external int get naturalHeight;
  external bool get complete;
  external String get currentSrc;
  external String get referrerPolicy;
  external set referrerPolicy(String value);
  external String get decoding;
  external set decoding(String value);
  external String get loading;
  external set loading(String value);
  external String get fetchPriority;
  external set fetchPriority(String value);
  external JSPromise<JSAny?> decode();
}
