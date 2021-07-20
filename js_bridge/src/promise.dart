
import 'dart:async';
import 'dart:js';

import 'callback.dart';
import 'methods.dart';

Future<T> promiseToFuture<T>(JsObject promise) {
  final completer = Completer<T>();
  final thenFunc = (Object? obj, T value) {
    completer.complete(value);
  };
  final catchFunc = (Object? obj, Object error) {
    completer.completeError(error);
  };

  promise..callMethod1<T>('then', callback1(thenFunc))..callMethod1<Object?>(method, arg0)


  return completer.future;
}
