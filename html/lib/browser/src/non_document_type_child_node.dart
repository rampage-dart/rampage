// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_html/html.dart';

import 'child_node.dart';
import 'element_from_js_object.dart';
import 'js/non_document_type_child_node.dart';

/// Browser implementation of [NonElementParentNode].
mixin NonDocumentTypeChildNodeImpl on ChildNodeImpl
    implements NonDocumentTypeChildNode {
  @override
  Element? get previousElementSibling =>
      safeElementFromObjectNullable(jsObject.previousElementSibling);

  @override
  Element? get nextElementSibling =>
      safeElementFromObjectNullable(jsObject.nextElementSibling);
}
