import 'dart:async';
import 'dart:collection';
import 'dart:js';

import 'package:rampage_html/html.dart';

import 'event_from_js_object.dart';
import 'js/add_event_listener_options.dart';
import 'js/event_target.dart';
import 'wrapper.dart';

class EventListeners extends JsWrapper with MapMixin<String, Stream<Event>> {
  EventListeners.fromJsObject(JsObject jsObject) : super.fromJsObject(jsObject);

  final Map<String, StreamController<Event>> _controllers =
      <String, StreamController<Event>>{};

  @override
  Stream<Event>? operator [](Object? key) {
    if (key == null) {
      return null;
    }

    final keyString = key.toString();
    if (keyString.isEmpty) {
      return null;
    }

    var controller = _controllers[key];
    if (controller != null) {
      return controller.stream;
    }

    controller = StreamController.broadcast();
    final listener = _eventListener(controller);
    final options = AddEventListenerOptionsJsObject.construct(
      capture: false,
      passive: false,
      once: false,
    );
    controller
      ..onListen = () {
        jsObject.addEventListener(keyString, listener, options);
      }
      ..onCancel = () {
        jsObject.removeEventListener(keyString, listener, options);
      };

    _controllers[key.toString()] = controller;

    return controller.stream;
  }

  @override
  void operator []=(String key, Stream<Event> value) {
    throw UnsupportedError('');
  }

  @override
  void clear() {
    throw UnsupportedError('');
  }

  @override
  Iterable<String> get keys => _controllers.keys;

  @override
  Stream<Event>? remove(Object? key) {
    throw UnsupportedError('');
  }

  JsFunction _eventListener(StreamController<Event> controller) {
    void func(Object? scope, Object event) {
      controller.add(safeEventFromObject(event));
    }

    return JsFunction.withThis(func);
  }
}
