// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'child_node.dart';
import 'js/element.dart';
import 'js/shadow_root_init.dart';
import 'named_node_map.dart';
import 'node.dart';
import 'non_document_type_child_node.dart';
import 'parent_node.dart';
import 'shadow_root.dart';
import 'slotable.dart';

/// Browser implementation of [Element].
class ElementImpl extends NodeImpl
    with
        ParentNodeImpl,
        ChildNodeImpl,
        NonDocumentTypeChildNodeImpl,
        SlotableImpl
    implements Element {
  /// Creates an instance of [ElementImpl] from the [jsObject].
  ElementImpl.fromJsObject(JsObject jsObject) : super.fromJsObject(jsObject);

  @override
  String get tagName => jsObject.tagName;

  @override
  String get id => jsObject.id;
  @override
  set id(String value) {
    jsObject.id = value;
  }

  @override
  String get className => jsObject.className;
  @override
  set className(String value) {
    jsObject.className = value;
  }

  @override
  late Map<String, String> attributes = NamedNodeMap.fromJsObject(
      JsObject.fromBrowserObject(jsObject.attributes));

  @override
  String get slot => jsObject.slot;
  @override
  set slot(String value) {
    jsObject.slot = value;
  }

  @override
  ShadowRoot? get shadowRoot =>
      safeShadowRootFromObjectNullable(jsObject.shadowRoot);

  @override
  ShadowRoot attachShadow() =>
      ShadowRootImpl.fromJsObject(JsObject.fromBrowserObject(
        jsObject.attachShadow(
          ShadowRootInitOptionsJsObject.construct(
            mode: 'open',
            delegatesFocus: false,
          ),
        ),
      ));
}
