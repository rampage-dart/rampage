// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'node.dart';
import 'non_element_parent_node.dart';
import 'parent_node.dart';
import 'wrapper.dart';

/// Browser implementation of [DocumentFragment].
class DocumentFragmentImpl extends NodeImpl
    with ParentNodeImpl, NonElementParentNodeImpl
    implements DocumentFragment {
  /// Create an instance of [DocumentFragmentImpl] from the [jsObject]
  DocumentFragmentImpl.fromJsObject(JsObject jsObject)
      : super.fromJsObject(jsObject);

  /// Create an instance of [DocumentFragmentImpl] from the [jsObject].
  ///
  /// This constructor should be used when its unclear if the [jsObject] has
  /// already been wrapped.
  factory DocumentFragmentImpl.safeFromJsObject(JsObject jsObject) =>
      (jsObject.dartObject ?? DocumentFragmentImpl.fromJsObject(jsObject))
          as DocumentFragmentImpl;
}
