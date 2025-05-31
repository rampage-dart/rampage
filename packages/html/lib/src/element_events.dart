// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:async';
import 'dart:collection';
import 'dart:js_interop';

import 'event.dart';
import 'js_interop/add_event_listener_options.dart' as js;
import 'js_interop/event.dart' as js;
import 'js_interop/event_target.dart' as js;
import 'wrapper.dart';

class ElementEvents<T extends js.EventTarget> extends JsWrapper<T>
    with MapMixin<String, Stream<Event>> {
  ElementEvents.fromJsObject(super.jsObject) : super.fromJsObject();

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

    var controller = _controllers[keyString];
    if (controller != null) {
      return controller.stream;
    }

    controller = StreamController.broadcast();
    void callback(js.Event event) {
      controller!.add(safeEventFromJsObject(event));
    }

    final listener = callback.toJS;
    final options = js.AddEventListenerOptions(
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

    _controllers[keyString] = controller;

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
}
