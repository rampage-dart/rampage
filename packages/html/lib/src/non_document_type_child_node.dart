// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'element.dart';
import 'js_interop/non_document_type_child_node.dart' as js;
import 'node.dart';

abstract mixin class NonDocumentTypeChildNode<
  T extends js.NonDocumentTypeChildNode
>
    implements Node<T> {
  Element? get previousElementSibling =>
      safeElementFromJsObjectNullable(jsObject.previousElementSibling);

  Element? get nextElementSibling =>
      safeElementFromJsObjectNullable(jsObject.nextElementSibling);
}
