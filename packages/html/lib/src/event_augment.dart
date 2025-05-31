// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

part of 'event.dart';

@internal
Event<T> eventFromJsObject<T extends js.Event>(T jsObject) {
  assert(
    js.DartWrapper(jsObject).dartObject == null,
    'the jsObject should not be wrapped',
  );

  if (jsObject.isA<js.CustomEvent>()) {
    return CustomEvent.fromJsObject(jsObject as js.CustomEvent) as Event<T>;
  } else if (jsObject.isA<js.UIEvent>()) {
    return uiEventFromJsObject(jsObject as js.UIEvent) as Event<T>;
  }

  return Event.fromJsObject(jsObject);
}
