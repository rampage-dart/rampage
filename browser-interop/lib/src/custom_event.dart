// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

@JS()
library rampage_browser_interop.src.custom_event;

import 'package:js/js.dart';

import 'event.dart';

/// The [CustomEvent] interface represents events initialized by an application
/// for any purpose.
@JS('CustomEvent')
class CustomEvent extends Event {
  /// Creates a [CustomEvent] with the given [type].
  ///
  /// The [eventInitDict] can be used to customize the behavior of the event
  /// as well as attaching data through [CustomEventInit.detail].
  external factory CustomEvent(String type, [CustomEventInit eventInitDict]);

  /// Any data passed when initializing the event.
  external dynamic get detail;
}

/// Represents options for creating a [CustomEvent].
@JS()
@anonymous
class CustomEventInit extends EventInit {
  /// Creates the [CustomEventInit] options.
  external factory CustomEventInit({
    bool bubbles = false,
    bool cancelable = false,
    bool composed = false,
    dynamic detail,
  });

  /// Data to pass to the event.
  external dynamic get detail;
  external set detail(dynamic value);
}
