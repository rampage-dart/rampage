// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:meta/meta.dart';

import 'element.dart';
import 'event_target.dart';
import 'js_interop/node.dart' as js;
import 'wrapper.dart';

// FIXME: https://github.com/dart-lang/sdk/issues/56204
// ignore: directives_ordering
import 'js_interop/wrapper.dart' as js;

part 'node_augment.dart';

class Node<T extends js.Node> extends EventTarget<T> {
  @protected
  Node.fromJsObject(super.jsObject) : super.fromJsObject();

  bool get isConnected => jsObject.isConnected;

  Node? get parentNode => safeNodeFromJsObjectNullable(jsObject.parentNode);

  Element? get parent =>
      safeElementFromJsObjectNullable(jsObject.parentElement);

  Node? get firstChild => safeNodeFromJsObjectNullable(jsObject.firstChild);

  Node? get lastChild => safeNodeFromJsObjectNullable(jsObject.lastChild);

  Node? get previousSibling =>
      safeNodeFromJsObjectNullable(jsObject.previousSibling);

  Node? get nextSibling => safeNodeFromJsObjectNullable(jsObject.nextSibling);

  U cloneNode<U extends Node>() =>
      safeNodeFromJsObject(jsObject.cloneNode(true)) as U;
}

Node<T> safeNodeFromJsObject<T extends js.Node>(T jsObject) =>
    safeJsWrapperFromJsObject<T>(jsObject, nodeFromJsObject) as Node<T>;

Node<T>? safeNodeFromJsObjectNullable<T extends js.Node>(T? jsObject) =>
    safeJsWrapperFromJsObjectNullable<T>(jsObject, nodeFromJsObject) as Node<T>;
