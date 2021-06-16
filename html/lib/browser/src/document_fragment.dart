// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'js/document_fragment.dart';
import 'node.dart';
import 'non_element_parent_node.dart';
import 'parent_node.dart';

/// Browser implementation of [DocumentFragment].
class DocumentFragmentImpl extends NodeImpl
    with ParentNodeImpl, NonElementParentNodeImpl
    implements DocumentFragment {
  /// Create an instance of [DocumentFragmentImpl].
  factory DocumentFragmentImpl() =>
      DocumentFragmentImpl.fromJsObject(DocumentFragmentJsObject.construct());

  /// Create an instance of [DocumentFragmentImpl] from the [jsObject]
  DocumentFragmentImpl.fromJsObject(JsObject jsObject)
      : super.fromJsObject(jsObject);
}
