// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'document_fragment.dart';
import 'document_or_shadow_root.dart';
import 'element.dart';
import 'shadow_root_mode.dart';
import 'slot_assignment_mode.dart';

extension type ShadowRoot._(JSObject _)
    implements JSObject, DocumentFragment, DocumentOrShadowRoot {
  external ShadowRootMode get mode;
  external bool get delegatesFocus;
  external SlotAssignmentMode get slotAssignment;
  external bool get clonable;
  external bool get serializable;
  external Element get host;
}
