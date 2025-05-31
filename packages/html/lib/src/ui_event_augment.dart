// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

part of 'ui_event.dart';

@internal
UIEvent<T> uiEventFromJsObject<T extends js.UIEvent>(T jsObject) {
  assert(
    js.DartWrapper(jsObject).dartObject == null,
    'the jsObject should not be wrapped',
  );

  if (jsObject.isA<js.MouseEvent>()) {
    return jsObject.isA<js.WheelEvent>()
        ? WheelEvent.fromJsObject(jsObject as js.WheelEvent) as UIEvent<T>
        : MouseEvent.fromJsObject(jsObject as js.MouseEvent) as UIEvent<T>;
  } else if (jsObject.isA<js.KeyboardEvent>()) {
    return KeyboardEvent.fromJsObject(jsObject as js.KeyboardEvent)
        as UIEvent<T>;
  } else if (jsObject.isA<js.FocusEvent>()) {
    return FocusEvent.fromJsObject(jsObject as js.FocusEvent) as UIEvent<T>;
  }

  return UIEvent.fromJsObject(jsObject);
}
