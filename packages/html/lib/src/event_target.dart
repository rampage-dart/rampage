// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:meta/meta.dart';

import 'js_interop/event_target.dart' as js;
import 'wrapper.dart';

// FIXME: https://github.com/dart-lang/sdk/issues/56204
// ignore: directives_ordering
import 'js_interop/wrapper.dart' as js;

part 'event_target_augment.dart';

class EventTarget<T extends js.EventTarget> extends DartJsWrapper<T> {
  @protected
  EventTarget.fromJsObject(super.jsObject) : super.fromJsObject();
}

@internal
EventTarget<T> safeEventTargetFromJsObject<T extends js.EventTarget>(
  T jsObject,
) =>
    safeJsWrapperFromJsObject<T>(jsObject, eventTargetFromJsObject)
        as EventTarget<T>;

@internal
EventTarget<T>? safeEventTargetFromJsObjectNullable<T extends js.EventTarget>(
  T? jsObject,
) =>
    safeJsWrapperFromJsObjectNullable<T>(jsObject, eventTargetFromJsObject)
        as EventTarget<T>;
