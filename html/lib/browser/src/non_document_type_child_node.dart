// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_html/html.dart';

import 'child_node.dart';

/// Browser implementation of [NonElementParentNode].
mixin NonDocumentTypeChildNodeImpl on ChildNodeImpl
    implements NonDocumentTypeChildNode {
  @override
  Element? get previousElementSibling =>
      throw UnimplementedError('previousElementSibling not implemented');

  @override
  Element? get nextElementSibling =>
      throw UnimplementedError('nextElementSibling not implemented');
}
