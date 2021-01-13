// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_html/html.dart';

import 'node.dart';

/// Browser implementation of [ParentNode].
mixin ParentNodeImpl on NodeImpl implements ParentNode {
  @override
  List<Element> get children =>
      throw UnimplementedError('children not implemented');

  @override
  Element? get firstElementChild =>
      throw UnimplementedError('firstElementChild not implemented');

  @override
  Element? get lastElementChild =>
      throw UnimplementedError('lastElementChild not implemented');

  @override
  void append(Node node) => throw UnimplementedError('append not implemented');

  @override
  void prepend(Node node) =>
      throw UnimplementedError('prepend not implemented');

  @override
  void replaceChildren(Node node) =>
      throw UnimplementedError('replaceChildren not implemented');

  @override
  T? querySelector<T extends Element>(String selectors) =>
      throw UnimplementedError('querySelector not implemented');

  @override
  Iterable<T> querySelectorAll<T extends Element>(String selectors) =>
      throw UnimplementedError('querySelectorAll not implemented');
}
