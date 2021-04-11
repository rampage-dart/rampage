// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:js';

extension ParentNodeJsObject on JsObject {
  Object get children => this['children'] as Object;

  Object? get firstElementChild => this['firstElementChild'];
  Object? get lastElementChild => this['lastElementChild'];

  void append(List<JsObject> nodes) {
    callMethod('append', nodes);
  }

  void prepend(List<JsObject> nodes) {
    callMethod('prepend', nodes);
  }

  void replaceChildren(List<JsObject> nodes) {
    callMethod('replaceChildren', nodes);
  }

  Object? querySelector(String selectors) =>
      callMethod('querySelector', <Object?>[selectors]);
}
