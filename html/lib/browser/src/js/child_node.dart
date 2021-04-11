// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:js';

extension ChildNodeJsObject on JsObject {
  void before(List<JsObject> nodes) => callMethod('before', nodes);

  void after(List<JsObject> nodes) => callMethod('after', nodes);

  void replaceWith(List<JsObject> nodes) => callMethod('replaceWith', nodes);

  void remove() => callMethod('remove');
}
