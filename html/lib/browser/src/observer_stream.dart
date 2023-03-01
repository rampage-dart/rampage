import 'dart:async';

import 'package:async/async.dart';
import 'package:rampage_html/html.dart';

import 'element.dart';
import 'js/observer.dart';
import 'wrapper.dart';

mixin ObserverImpl on JsWrapper {
  void observe(Element element) {
    jsObject.observe((element as ElementImpl).jsObject);
  }

  void unobserve(Element element) {
    jsObject.unobserve((element as ElementImpl).jsObject);
  }
}

abstract class ObserverEntry {
  bool isTarget(Element element);
}

class ObserverStreamImpl<Observer extends ObserverImpl, T extends ObserverEntry>
    extends DelegatingStream<T> implements ObserverStream<T> {
  ObserverStreamImpl(super.stream, Observer observer) : _observer = observer;

  final Observer _observer;

  @override
  StreamSubscription<T> listenForElement(
    Element element,
    void Function(T event) onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    _observer.observe(element);

    // ignore: cancel_subscriptions
    final subscription = where((entry) => entry.isTarget(element)).listen(
      onData,
      onError: onError,
      onDone: onDone,
      cancelOnError: cancelOnError,
    );

    return _ObserveElementStreamSubscription(subscription, _observer, element);
  }
}

class _ObserveElementStreamSubscription<Observer extends ObserverImpl,
    T extends ObserverEntry> extends DelegatingStreamSubscription<T> {
  _ObserveElementStreamSubscription(
    super.sourceSubscription,
    this._observer,
    this._element,
  );

  final Observer _observer;
  final Element _element;

  @override
  Future<void> cancel() {
    _observer.unobserve(_element);
    return super.cancel();
  }
}
