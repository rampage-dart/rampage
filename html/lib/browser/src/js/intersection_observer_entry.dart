// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:js';

extension IntersectionObserverEntryJsObject on JsObject {
  bool get isInstanceOf =>
      instanceof(context['IntersectionObserverEntry'] as JsFunction);

  double get time => this['time'] as double;
  Object? get rootBounds => this['rootBounds'];
  Object get boundingClientRect => this['boundingClientRect'] as Object;
  Object get intersectionRect => this['intersectionRect'] as Object;
  bool get isIntersecting => this['isIntersecting'] as bool;
  double get intersectionRatio => this['intersectionRation'] as double;
  Object get target => this['target'] as Object;
}
