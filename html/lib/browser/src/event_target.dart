// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'wrapper.dart';

/// Browser implementation of [EventTarget].
class EventTargetImpl extends DartJsWrapper implements EventTarget {
  /// Creates an instance of [EventTargetImpl] from the [JsObject].
  EventTargetImpl.fromJsObject(JsObject jsObject)
      : super.fromJsObject(jsObject);

  @override
  Map<String, Stream<Event>> get on =>
      throw UnimplementedError('on not implemented');

  @override
  bool dispatchEvent(Event event) =>
      throw UnimplementedError('dispatchEvent not implemented');
}
