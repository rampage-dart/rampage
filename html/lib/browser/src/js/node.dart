// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

// ignore_for_file: public_member_api_docs, avoid_positional_boolean_parameters

import 'dart:js';

extension NodeJsObject on JsObject {
  bool get isInstanceOf => instanceof(context['Node'] as JsFunction);

  int get nodeType => this['nodeType'] as int;
  String get nodeName => this['nodeName'] as String;
  bool get isConnected => this['isConnected'] as bool;
  Object? get ownerDocument => this['ownerDocument'];
  Object? get parentNode => this['parentNode'];
  Object? get parent => this['parentElement'];
  Object get childNodes => this['childNodes'] as Object;
  Object? get firstChild => this['firstChild'];
  Object? get lastChild => this['lastChild'];
  Object? get previousSibling => this['previousSibling'];
  Object? get nextSibling => this['nextSibling'];

  Object cloneNode(bool deep) =>
      callMethod('cloneNode', <bool>[deep]) as Object;
  Object insertBefore(JsObject node, JsObject? child) =>
      callMethod('insertBefore', <JsObject?>[node, child]) as Object;
  Object appendChild(JsObject node) =>
      callMethod('appendChild', <JsObject>[node]) as Object;
  Object replaceChild(JsObject node) =>
      callMethod('replaceChild', <JsObject>[node]) as Object;
  Object removeChild(JsObject node) =>
      callMethod('removeChild', <JsObject>[node]) as Object;
}
