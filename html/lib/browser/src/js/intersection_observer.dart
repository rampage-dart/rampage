// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:js';

export 'observer.dart';

extension IntersectionObserverJsObject on JsObject {
  static JsFunction _constructor() =>
      context['IntersectionObserver'] as JsFunction;

  static JsObject construct(
    JsFunction /* IntersectionObserverCallback */ callback,
    JsObject /* IntersectionObserverInit */ options,
  ) =>
      JsObject(
        _constructor(),
        <Object?>[callback, options],
      );

  bool get isInstanceOf => instanceof(_constructor());

  Object? get root => this['root'];

  void disconnect() {
    callMethod('disconnect');
  }
}
