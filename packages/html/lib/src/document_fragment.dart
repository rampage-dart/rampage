// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:meta/meta.dart';

import 'js_interop/document_fragment.dart' as js;
import 'node.dart';
import 'non_element_parent_node.dart';
import 'parent_node.dart';

class DocumentFragment<T extends js.DocumentFragment> extends Node<T>
    with ParentNode<T>, NonElementParentNode<T> {
  @protected
  DocumentFragment.fromJsObject(super.jsObject) : super.fromJsObject();
}
