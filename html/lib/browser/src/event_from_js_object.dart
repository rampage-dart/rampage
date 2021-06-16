// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'custom_event.dart';
import 'event.dart';
import 'focus_event.dart';
import 'js/custom_event.dart';
import 'js/focus_event.dart';
import 'js/keyboard_event.dart';
import 'js/mouse_event.dart';
import 'js/ui_event.dart';
import 'js/wheel_event.dart';
import 'keyboard_event.dart';
import 'mouse_event.dart';
import 'ui_event.dart';
import 'wheel_event.dart';
import 'wrapper.dart';

/// Creates an [Event] from the given [jsObject].
///
/// The hierarchy of [Event] looks like the following.
///
///     Event
///       ├── CustomEvent
///       └── UIEvent
///           ├── MouseEvent
///           |   └── WheelEvent
///           ├── KeyboardEvent
///           └── FocusEvent
///
/// The prototype from the [JsObject] is used to determine what the underlying
/// type is. Then the appropriate wrapper is created over it.
EventImpl eventFromJsObject(JsObject jsObject) {
  assert(jsObject.dartObject == null, 'the jsObject should not be wrapped');

  if (CustomEventJsObject(jsObject).isInstanceOf) {
    return CustomEventImpl.fromJsObject(jsObject);
  } else if (UIEventJsObject(jsObject).isInstanceOf) {
    if (MouseEventJsObject(jsObject).isInstanceOf) {
      return WheelEventJsObject(jsObject).isInstanceOf
          ? WheelEventImpl.fromJsObject(jsObject)
          : MouseEventImpl.fromJsObject(jsObject);
    } else if (KeyboardEventJsObject(jsObject).isInstanceOf) {
      return KeyboardEventImpl.fromJsObject(jsObject);
    } else if (FocusEventJsObject(jsObject).isInstanceOf) {
      return FocusEventImpl.fromJsObject(jsObject);
    }

    return UIEventImpl.fromJsObject(jsObject);
  }

  return EventImpl.fromJsObject(jsObject);
}

/// Safely retrieves or creates an instance of [EventImpl] from the [object].
EventImpl safeEventFromObject(Object object) =>
    safeJsWrapperFromObject<EventImpl>(object, eventFromJsObject);

/// Safely retrieves or creates an instance of [EventImpl] from the [object] if
/// it is not `null`.
EventImpl? safeEventFromObjectNullable(Object? object) =>
    safeJsWrapperFromObjectNullable<EventImpl>(object, eventFromJsObject);
