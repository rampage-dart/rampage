// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_browser_interop/browser_interop.dart' as interop;
import 'package:rampage_html/html.dart';

import 'element.dart';
import 'event.dart';
import 'js_wrapper.dart';

/// Browser implementation of [EventTarget].
class EventTargetImpl<T extends interop.EventTarget> extends JsWrapper<T>
    implements EventTarget {
  /// Creates an instance of [EventTargetImpl] from the [jsObject].
  EventTargetImpl.fromJsObject(T jsObject) : super.fromJsObject(jsObject);

  @override
  final Map<String, Stream<Event>> on = <String, Stream<Event>>{};

  @override
  bool dispatchEvent(Event event) =>
      jsObject.dispatchEvent((event as EventImpl).jsObject);
}

/// Creates an instance of [T] from the [jsObject].
T eventTargetFromJsObject<T extends EventTarget>(interop.EventTarget jsObject) {
  if (jsObject is interop.Element) {
    return elementFromJsObject(jsObject) as T;
  }

  assert(false, 'Unknown event target');
  return null;
}

/// Creates an instance of [T] from the [jsObject].
///
/// This function should be used when its unclear if the [jsObject] has already
/// has already been wrapped.
T safeEventTargetFromJsObject<T extends EventTarget>(
        interop.EventTarget jsObject) =>
    jsObject.dartObject as T ?? eventTargetFromJsObject(jsObject);
