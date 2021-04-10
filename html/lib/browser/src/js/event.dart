// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:js';

extension EventJsObject on JsObject {
  static JsFunction _constructor() => context['Event'] as JsFunction;

  static JsObject construct(
    String type,
    JsObject /* EventInit */ eventInitDict,
  ) =>
      JsObject(
        _constructor(),
        <Object?>[type, eventInitDict],
      );

  bool get isInstanceOf => instanceof(_constructor());

  String get type => this['type'] as String;
  Object? get target => this['target'];
  Object? get currentTarget => this['currentTarget'];
  int get eventPhase => this['eventPhase'] as int;
  bool get bubbles => this['bubbles'] as bool;
  bool get cancelable => this['cancelable'] as bool;
  bool get defaultPrevented => this['defaultPrevented'] as bool;
  bool get composed => this['composed'] as bool;
  double get timeStamp => this['timestamp'] as double;

  void stopPropagation() => callMethod('preventDefault');
  void stopImmediatePropagation() => callMethod('stopImmediatePropagation');
  void preventDefault() => callMethod('preventDefault');
}
