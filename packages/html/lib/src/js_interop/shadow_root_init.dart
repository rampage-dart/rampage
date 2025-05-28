// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'shadow_root_mode.dart';
import 'slot_assignment_mode.dart';

extension type ShadowRootInit._(JSObject _) implements JSObject {
  external factory ShadowRootInit({
    ShadowRootMode mode,
    bool delegatesFocus,
    SlotAssignmentMode slotAssignment,
    bool clonable,
    bool serializable,
  });

  external ShadowRootMode get mode;
  external set mode(ShadowRootMode value);
  external bool get delegatesFocus;
  external set delegatesFocus(bool value);
  external SlotAssignmentMode get slotAssignment;
  external set slotAssignment(SlotAssignmentMode value);
  external bool get clonable;
  external set clonable(bool value);
  external bool get serializable;
  external set serializable(bool value);
}
