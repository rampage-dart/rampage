// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'event.dart';
import 'event_listener_stream.dart';
import 'js/event_target.dart';
import 'wrapper.dart';

/// Browser implementation of [EventTarget].
class EventTargetImpl extends DartJsWrapper implements EventTarget {
  /// Creates an instance of [EventTargetImpl] from the [JsObject].
  EventTargetImpl.fromJsObject(super.jsObject) : super.fromJsObject();

  @override
  late final Map<String, Stream<Event>> on =
      EventListeners.fromJsObject(jsObject);

  @override
  bool dispatchEvent(Event event) =>
      jsObject.dispatchEvent((event as EventImpl).jsObject);
}
