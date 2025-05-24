// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:meta/meta.dart';

import 'event_target.dart';
import 'js_interop/abort_signal.dart' as js;

class AbortSignal<T extends js.AbortSignal> extends EventTarget<T> {
  @protected
  AbortSignal.fromJsObject(super.jsObject) : super.fromJsObject();

  bool get aborted => jsObject.aborted;
  Object? get reason => jsObject.reason;
}
