// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'attr.dart';
import 'document_or_shadow_root.dart';
import 'element.dart';
import 'head_element.dart';
import 'html_element.dart';
import 'node.dart';
import 'non_element_parent_node.dart';
import 'parent_node.dart';

extension type Document._(JSObject _)
    implements
        JSObject,
        Node,
        NonElementParentNode,
        DocumentOrShadowRoot,
        ParentNode {
  external factory Document();

  external String get title;
  external set title(String value);
  external String get dir;
  external set dir(String value);
  external HTMLElement? get body;
  external set body(HTMLElement? value);
  external HTMLHeadElement? get head;
  external Element? get documentElement;
  external Attr createAttribute(String localName);
  external Element createElement(String localName, [JSAny options]);
}

@JS()
external Document get document;
