// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'event_target.dart';
import 'js/node.dart';
import 'js/window.dart';
import 'node_from_js_object.dart';
import 'window.dart';
import 'wrapper.dart';

EventTargetImpl eventTargetFromJsObject(JsObject jsObject) {
  assert(jsObject.dartObject == null, 'the jsObject should not be wrapped');

  if (NodeJsObject(jsObject).isInstanceOf) {
    return nodeFromJsObject(jsObject);
  } else if (WindowJsObject(jsObject).isInstanceOf) {
    return WindowImpl.fromJsObject(jsObject);
  } else {
    return EventTargetImpl.fromJsObject(jsObject);
  }
}

/// Safely retrieves or creates an instance of [EventTargetImpl] from the
/// [object].
EventTargetImpl safeEventTargetFromObject(Object object) =>
    safeJsWrapperFromObject<EventTargetImpl>(object, eventTargetFromJsObject);

/// Safely retrieves or creates an instance of [EventTargetImpl] from the
/// [object] if it is not `null`.
EventTargetImpl? safeEventTargetFromObjectNullable(Object? object) =>
    safeJsWrapperFromObjectNullable<EventTargetImpl>(
      object,
      eventTargetFromJsObject,
    );
