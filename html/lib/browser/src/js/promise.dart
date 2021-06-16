// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:async';
import 'dart:js';

/// Converts the JavaScript Promise to a Dart [Future].
///
/// The Dart future is completed successfully when the [promise]'s `onFulfilled`
/// method is called. If the [promise]'s `onRejected` method is called then the
/// Future completes with an error.
Future<T> promiseToFuture<T>(JsObject promise) {
  final completer = Completer<T>();

  void onFulfilled(Object? obj, T value) {
    completer.complete(value);
  }

  void onRejected(Object? object, Object error) {
    completer.completeError(error);
  }

  promise.callMethod('then', <Object?>[
    JsFunction.withThis(onFulfilled),
    JsFunction.withThis(onRejected),
  ]);

  return completer.future;
}

typedef ConvertPromiseResult<T> = T Function(JsObject);

Future<T> promiseToFutureWithConversion<T>(
  JsObject promise,
  ConvertPromiseResult<T> convert,
) {
  final completer = Completer<T>();

  void onFulfilled(Object? obj, JsObject value) {
    completer.complete(convert(value));
  }

  void onRejected(Object? object, Object error) {
    completer.completeError(error);
  }

  promise.callMethod('then', <Object?>[
    JsFunction.withThis(onFulfilled),
    JsFunction.withThis(onRejected),
  ]);

  return completer.future;
}
