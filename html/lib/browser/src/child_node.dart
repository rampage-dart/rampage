// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_html/html.dart';

import 'node.dart';

/// Browser implementation of [ChildNode].
mixin ChildNodeImpl on NodeImpl implements ChildNode {
  @override
  void remove() => throw UnimplementedError('remove not implemented');

  @override
  void before(Node node) => throw UnimplementedError('before not implemented');

  @override
  void after(Node node) => throw UnimplementedError('after not implemented');

  @override
  void replaceWith(Node node) =>
      throw UnimplementedError('replaceWith not implemented');
}
