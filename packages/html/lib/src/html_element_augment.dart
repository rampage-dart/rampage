// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

part of 'html_element.dart';

@internal
HtmlElement<T> htmlElementFromJsObject<T extends js.HTMLElement>(T jsObject) {
  assert(
    js.DartWrapper(jsObject).dartObject == null,
    'the jsObject should not be wrapped',
  );

  return HtmlElement.fromJsObject(jsObject);
}
