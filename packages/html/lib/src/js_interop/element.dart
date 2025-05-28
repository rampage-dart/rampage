// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'child_node.dart';
import 'named_node_map.dart';
import 'node.dart';
import 'non_document_type_child_node.dart';
import 'parent_node.dart';
import 'shadow_root.dart';
import 'shadow_root_init.dart';
import 'slottable.dart';

extension type Element._(JSObject _)
    implements
        JSObject,
        Node,
        ParentNode,
        NonDocumentTypeChildNode,
        ChildNode,
        Slottable {
  external String get tagName;
  external String get id;
  external set id(String value);
  external String get className;
  external set className(String value);
  external String get slot;
  external set slot(String value);
  external NamedNodeMap get attributes;
  external ShadowRoot? get shadowRoot;
  external ShadowRoot attachShadow(ShadowRootInit init);
}
