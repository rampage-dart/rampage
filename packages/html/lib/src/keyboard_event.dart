// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:meta/meta.dart';

import 'js_interop/keyboard_event.dart' as js;
import 'ui_event.dart';

final class KeyboardEvent extends UIEvent<js.KeyboardEvent> {
  @protected
  KeyboardEvent.fromJsObject(super.jsObject) : super.fromJsObject();

  String get key => jsObject.key;

  String get code => jsObject.code;

  int get location => jsObject.location;

  bool get ctrlKey => jsObject.ctrlKey;

  bool get shiftKey => jsObject.shiftKey;

  bool get altKey => jsObject.altKey;

  bool get metaKey => jsObject.metaKey;

  bool get repeat => jsObject.repeat;

  bool get isComposing => jsObject.isComposing;

  int get charCode => jsObject.charCode;

  int get keyCode => jsObject.keyCode;
}
