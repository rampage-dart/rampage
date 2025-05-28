// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:meta/meta.dart';

import 'child_node.dart';
import 'js_interop/element.dart' as js;
import 'js_interop/shadow_root_init.dart' as js;
import 'named_node_map.dart';
import 'node.dart';
import 'non_document_type_child_node.dart';
import 'parent_node.dart';
import 'shadow_root.dart';
import 'shadow_root_mode.dart';
import 'slot_assignment_mode.dart';
import 'slottable.dart';
import 'wrapper.dart';

// FIXME: https://github.com/dart-lang/sdk/issues/56204
// ignore: directives_ordering
import 'js_interop/wrapper.dart' as js;

part 'element_augment.dart';

class Element<T extends js.Element> extends Node<T>
    with
        ParentNode<T>,
        ChildNode<T>,
        NonDocumentTypeChildNode<T>,
        Slottable<T> {
  @protected
  Element.fromJsObject(super.jsObject) : super.fromJsObject();

  String get tagName => jsObject.tagName;

  String get id => jsObject.id;

  set id(String value) {
    jsObject.id = value;
  }

  String get className => jsObject.className;

  set className(String value) {
    jsObject.className = value;
  }

  late Map<String, String> attributes = NamedNodeMap.fromJsObject(
    jsObject.attributes,
  );

  String get slot => jsObject.slot;

  set slot(String value) {
    jsObject.slot = value;
  }

  ShadowRoot? get shadowRoot =>
      safeShadowRootFromObjectNullable(jsObject.shadowRoot);

  ShadowRoot attachShadow({
    ShadowRootMode mode = ShadowRootMode.closed,
    bool delegatesFocus = false,
    SlotAssignmentMode slotAssignment = SlotAssignmentMode.named,
    bool clonable = false,
    bool serializable = false,
  }) => ShadowRoot.fromJsObject(
    jsObject.attachShadow(
      js.ShadowRootInit(
        mode: mode.toJS,
        delegatesFocus: delegatesFocus,
        slotAssignment: slotAssignment.toJS,
        clonable: clonable,
        serializable: serializable,
      ),
    ),
  );
}

Element<T> safeElementFromJsObject<T extends js.Element>(T jsObject) =>
    safeJsWrapperFromJsObject<T>(jsObject, elementFromJsObject) as Element<T>;

Element<T>? safeElementFromJsObjectNullable<T extends js.Element>(
  T? jsObject,
) =>
    safeJsWrapperFromJsObjectNullable<T>(jsObject, elementFromJsObject)
        as Element<T>;
