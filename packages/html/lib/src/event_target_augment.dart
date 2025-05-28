// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

part of 'event_target.dart';

@internal
EventTarget<T> eventTargetFromJsObject<T extends js.EventTarget>(T jsObject) {
  assert(
    js.DartWrapper(jsObject).dartObject == null,
    'the jsObject should not be wrapped',
  );

  return jsObject.isA<js.Node>()
      ? nodeFromJsObject(jsObject as js.Node) as EventTarget<T>
      : EventTarget.fromJsObject(jsObject);
}
