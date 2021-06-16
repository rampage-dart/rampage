// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_html/html.dart';

import 'element_from_js_object.dart';
import 'js/non_element_parent_node.dart';
import 'parent_node.dart';

/// Browser implementation of [NonElementParentNode].
mixin NonElementParentNodeImpl on ParentNodeImpl
    implements NonElementParentNode {
  @override
  T? getElementById<T extends Element>(String id) =>
      safeElementFromObjectNullable(jsObject.getElementById(id)) as T?;
}
