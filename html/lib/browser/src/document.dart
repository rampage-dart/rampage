// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'document_or_shadow_root.dart';
import 'global_event_handlers.dart';
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
  /// Create an instance of [DocumentImpl] from the [jsObject].
  DocumentImpl.fromJsObject(JsObject jsObject) : super.fromJsObject(jsObject);

  /// Create an instance of [DocumentImpl] from the [jsObject].
  ///
  /// This constructor should be used when its unclear if the [jsObject] has
  /// already been wrapped.
  factory DocumentImpl.safeFromJsObject(JsObject jsObject) =>
      (jsObject.dartObject ?? DocumentImpl.fromJsObject(jsObject))
          as DocumentImpl;

  @override
  HtmlElement? get body => throw UnimplementedError('body not implemented');
  @override
  set body(HtmlElement? value) =>
      throw UnimplementedError('body not implemented');
}
