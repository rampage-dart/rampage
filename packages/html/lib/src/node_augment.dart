// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

part of 'node.dart';

@internal
Node<T> nodeFromJsObject<T extends js.Node>(T jsObject) {
  assert(
    js.DartWrapper(jsObject).dartObject == null,
    'the jsObject should not be wrapped',
  );

  final nodeType = jsObject.nodeType;
  return switch (nodeType) {
        1 => elementFromJsObject(jsObject as js.Element),
        9 => Document.fromJsObject(jsObject as js.Document),
        11 => DocumentFragment.fromJsObject(jsObject as js.DocumentFragment),
        _ => throw UnsupportedError('Unknown node type $nodeType'),
      }
      as Node<T>;
}
