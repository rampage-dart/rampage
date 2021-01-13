// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'wrapper.dart';

/// Browser implementation of [Event].
class EventImpl extends DartJsWrapper implements Event {
  /// Create an instance of [EventImpl] from the [jsObject].
  EventImpl.fromJsObject(JsObject jsObject) : super.fromJsObject(jsObject);

  @override
  String get type => throw UnimplementedError('type not implemented');

  @override
  EventTarget get target => throw UnimplementedError('target not implemented');

  @override
  EventTarget get currentTarget =>
      throw UnimplementedError('currentTarget not implemented');

  @override
  EventPhase get eventPhase =>
      throw UnimplementedError('eventPhase not implemented');

  @override
  bool get bubbles => throw UnimplementedError('bubbles not implemented');

  @override
  bool get cancelable => throw UnimplementedError('cancelable not implemented');

  @override
  bool get defaultPrevented =>
      throw UnimplementedError('defaultPrevented not implemented');

  @override
  bool get composed => throw UnimplementedError('composed not implemented');

  @override
  double get timeStamp => throw UnimplementedError('timeStamp not implemented');

  @override
  void preventDefault() =>
      throw UnimplementedError('preventDefault not implemented');

  @override
  void stopImmediatePropagation() =>
      throw UnimplementedError('stopImmediatePropagation not implemented');

  @override
  void stopPropagation() =>
      throw UnimplementedError('stopPropagation not implemented');
}
