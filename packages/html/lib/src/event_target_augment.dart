// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

part of 'event_target.dart';

import 'js_interop/wrapper.dart' as js;

@internal
EventTarget<T> eventTargetFromJsObject<T extends js.EventTarget>(T jsObject) {
  assert(
    js.DartWrapper(jsObject).dartObject == null,
    'the jsObject should not be wrapped',
  );

  return EventTarget.fromJsObject(jsObject);
}
