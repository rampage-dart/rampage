// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

// ignore_for_file: directives_ordering

import 'package:meta/meta.dart';

import 'event.dart';
import 'js_interop/ui_event.dart' as js;
import 'window.dart';

// FIXME: https://github.com/dart-lang/sdk/issues/56204
import 'dart:js_interop';
import 'focus_event.dart';
import 'js_interop/focus_event.dart' as js;
import 'js_interop/keyboard_event.dart' as js;
import 'js_interop/mouse_event.dart' as js;
import 'js_interop/wheel_event.dart' as js;
import 'js_interop/wrapper.dart' as js;
import 'keyboard_event.dart';
import 'mouse_event.dart';
import 'wheel_event.dart';

part 'ui_event_augment.dart';

class UIEvent<T extends js.UIEvent> extends Event<T> {
  @protected
  UIEvent.fromJsObject(super.jsObject) : super.fromJsObject();

  Window? get view => safeWindowFromObjectNullable(jsObject.view);

  int get detail => jsObject.detail;

  int get which => jsObject.which;
}
