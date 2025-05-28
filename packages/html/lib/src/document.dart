// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:meta/meta.dart';

import 'document_or_shadow_root.dart';
import 'element.dart';
import 'js_interop/document.dart' as js;
import 'node.dart';
import 'non_element_parent_node.dart';
import 'parent_node.dart';
import 'wrapper.dart';

final class Document extends Node<js.Document>
    with
        ParentNode<js.Document>,
        NonElementParentNode<js.Document>,
        DocumentOrShadowRoot<js.Document> {
  /// Create an instance of [Document].
  factory Document() => Document.fromJsObject(js.Document());

  @protected
  Document.fromJsObject(super.jsObject) : super.fromJsObject();

  Element? get documentElement =>
      safeElementFromJsObjectNullable(jsObject.documentElement);
}

@internal
Document safeDocumentFromObject(js.Document jsObject) =>
    safeJsWrapperFromJsObject<js.Document>(jsObject, Document.fromJsObject)
        as Document;

@internal
Document? safeDocumentFromObjectNullable(js.Document? object) =>
    safeJsWrapperFromJsObjectNullable<js.Document>(
          object,
          Document.fromJsObject,
        )
        as Document;
