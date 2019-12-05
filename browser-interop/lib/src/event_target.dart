// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

@JS()
library rampage_browser_interop.src.event_target;

import 'package:js/js.dart';

import 'event.dart';
import 'js_object.dart';

/// [EventTarget] is a DOM interface implemented by objects that can receive
/// events and may have listeners for them.
@JS('EventTarget')
class EventTarget extends JsObject {
  /// Registers an event handler of a specific event type on the [EventTarget].
  external void addEventListener(
    String type,
    EventListener callback, [
    AddEventListenerOptions options,
  ]);

  /// Removes an event listener from the [EventTarget].
  external void removeEventListener(
    String type,
    EventListener callback, [
    EventListenerOptions options,
  ]);

  /// Dispatches an [Event] to this [EventTarget].
  external bool dispatchEvent(Event event);
}

/// A function that can handle an event dispatched by an [EventTarget] object.
typedef EventListener = void Function(Event event);

/// Represents options that represent characteristics about an event listener.
@JS()
@anonymous
class EventListenerOptions {
  /// Indicates that [Event]s of this type will be dispatched to the registered
  /// listener before being dispatched to any [EventTarget] beneath it in the
  /// DOM tree.
  external bool get capture;
  external set capture(bool value);
}

/// Represents options that represent characteristics about an event listener.
@JS()
@anonymous
class AddEventListenerOptions extends EventListenerOptions {
  /// Creates the [AddEventListenerOptions].
  external factory AddEventListenerOptions({
    bool capture = false,
    bool passive = false,
    bool once = false,
  });

  /// If true, indicates that the function specified by listener will never call
  /// [Event.preventDefault].
  external bool get passive;
  external set passive(bool value);

  /// Indicates that the listener should be invoked at most once after being
  /// added.
  ///
  /// If `true`, the listener would be automatically removed when invoked.
  external bool get once;
  external set once(bool value);
}
