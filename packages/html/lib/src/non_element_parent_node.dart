// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'element.dart';
import 'js_interop/non_element_parent_node.dart' as js;
import 'node.dart';

abstract mixin class NonElementParentNode<T extends js.NonElementParentNode>
    implements Node<T> {
  U? getElementById<U extends Element>(String id) =>
      safeElementFromJsObjectNullable(jsObject.getElementById(id)) as U;
}
