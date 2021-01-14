// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'child_node.dart';
import 'element_tag.dart';
import 'node.dart';
import 'non_document_type_child_node.dart';
import 'parent_node.dart';
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
  String get id => throw UnimplementedError('id not implemented');
  @override
  set id(String value) => throw UnimplementedError('id not implemented');

  @override
  Map<String, String> get attributes =>
      throw UnimplementedError('attributes not implemented');

  @override
  String get slot => throw UnimplementedError('slot not implemented');
  @override
  set slot(String value) => throw UnimplementedError('slot not implemented');

  @override
  ShadowRoot get shadowRoot =>
      throw UnimplementedError('shadowRoot not implemented');

  @override
  ShadowRoot attachShadow() =>
      throw UnimplementedError('attachShadow not implemented');
}
