import 'dart:async';

import 'element.dart';

abstract class ObserverStream<T> implements Stream<T> {
  StreamSubscription<T> listenForElement(
    Element element,
    void Function(T event) onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  });
}
