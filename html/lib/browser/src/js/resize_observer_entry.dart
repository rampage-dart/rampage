// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:js';

extension ResizeObserverEntryJsObject on JsObject {
  bool get isInstanceOf =>
      instanceof(context['ResizeObserverEntry'] as JsFunction);

  Object get target => this['target'] as Object;
  Object get contentRect => this['contentRect'] as Object;
}
