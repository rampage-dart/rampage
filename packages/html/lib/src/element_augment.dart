// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

part of 'element.dart';

@internal
Element<T> elementFromJsObject<T extends js.Element>(T jsObject) {
  assert(
    js.DartWrapper(jsObject).dartObject == null,
    'the jsObject should not be wrapped',
  );

  return jsObject.isA<js.HTMLElement>()
      ? htmlElementFromJsObject<js.HTMLElement>(jsObject as js.HTMLElement)
            as Element<T>
      : throw UnsupportedError('svg not supported');
}
