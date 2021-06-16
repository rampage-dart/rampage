// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'document_or_shadow_root.dart';
import 'element_from_js_object.dart';
import 'global_event_handlers.dart';
import 'head_element.dart';
import 'html_element_from_js_object.dart';
import 'js/document.dart';
import 'node.dart';
import 'non_element_parent_node.dart';
import 'parent_node.dart';
import 'wrapper.dart';

/// Browser implementation of [Document].
class DocumentImpl extends NodeImpl
    with
        ParentNodeImpl,
        NonElementParentNodeImpl,
        DocumentOrShadowRootImpl,
        GlobalEventHandlersImpl
    implements Document {
  /// Create an instance of [DocumentImpl]
  factory DocumentImpl() =>
      DocumentImpl.fromJsObject(DocumentJsObject.construct());

  /// Create an instance of [DocumentImpl] from the [jsObject].
  DocumentImpl.fromJsObject(JsObject jsObject) : super.fromJsObject(jsObject);

  @override
  HtmlElement? get body => safeHtmlElementFromObjectNullable(jsObject.body);
  @override
  set body(HtmlElement? value) {
    jsObject.body = toJsObjectNullable(value);
  }

  @override
  HeadElement? get head => safeHeadElementFromObjectNullable(jsObject.head);

  @override
  Element? get documentElement =>
      safeElementFromObjectNullable(jsObject.documentElement);
}

// \TODO Remove if constructor tear-offs are added to the language
DocumentImpl _constructor(JsObject jsObject) =>
    DocumentImpl.fromJsObject(jsObject);

/// Create an instance of [Document] from the [object].
///
/// This should be used when its unclear if the [object] has already been
/// wrapped.
DocumentImpl safeDocumentFromObject(Object object) =>
    safeJsWrapperFromObject<DocumentImpl>(object, _constructor);

/// Create an instance of [Document] from the [object]; or null otherwise.
///
/// This should be used when its unclear if the [object] has already been
/// wrapped.
DocumentImpl? safeDocumentFromObjectNullable(Object? object) =>
    safeJsWrapperFromObjectNullable<DocumentImpl>(object, _constructor);
