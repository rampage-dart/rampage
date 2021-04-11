// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/browser/html.dart';
import 'package:rampage_html/html.dart';

import 'js/keyboard_event.dart';
import 'js/keyboard_event_init.dart';
import 'ui_event.dart';
import 'wrapper.dart';

/// Browser implementation of [KeyboardEvent].
class KeyboardEventImpl extends UIEventImpl implements KeyboardEvent {
  /// Creates an instance of [KeyboardEventImpl].
  factory KeyboardEventImpl(
    String type, {
    bool bubbles = false,
    bool cancelable = false,
    bool composed = false,
    Window? view,
    int detail = 0,
    bool ctrlKey = false,
    bool shiftKey = false,
    bool altKey = false,
    bool metaKey = false,
    bool modifierAltGraph = false,
    bool modifierCapsLock = false,
    bool modifierFn = false,
    bool modifierFnLock = false,
    bool modifierHyper = false,
    bool modifierNumLock = false,
    bool modifierScrollLock = false,
    bool modifierSuper = false,
    bool modifierSymbol = false,
    bool modifierSymbolLock = false,
    String key = '',
    String code = '',
    int location = 0,
    bool repeat = false,
    bool isComposing = false,
  }) =>
      KeyboardEventImpl.fromJsObject(KeyboardEventJsObject.construct(
        type,
        KeyboardEventInitJsObject.construct(
          bubbles: bubbles,
          cancelable: cancelable,
          composed: composed,
          view: null, //view,
          detail: detail,
          ctrlKey: ctrlKey,
          shiftKey: shiftKey,
          altKey: altKey,
          metaKey: metaKey,
          modifierAltGraph: modifierAltGraph,
          modifierCapsLock: modifierCapsLock,
          modifierFn: modifierFn,
          modifierFnLock: modifierFnLock,
          modifierHyper: modifierHyper,
          modifierNumLock: modifierNumLock,
          modifierScrollLock: modifierScrollLock,
          modifierSuper: modifierSuper,
          modifierSymbol: modifierSymbol,
          modifierSymbolLock: modifierSymbolLock,
          key: key,
          code: code,
          location: location,
          repeat: repeat,
          isComposing: isComposing,
        ),
      ));

  /// Creates an instance of [KeyboardEventImpl] from the [jsObject].
  KeyboardEventImpl.fromJsObject(JsObject jsObject)
      : super.fromJsObject(jsObject);

  /// Create an instance of [KeyboardEventImpl] from the [jsObject].
  ///
  /// This constructor should be used when its unclear if the [jsObject] has
  /// already been wrapped.
  factory KeyboardEventImpl.safeFromJsObject(JsObject jsObject) =>
      (jsObject.dartObject ?? KeyboardEventImpl.fromJsObject(jsObject))
          as KeyboardEventImpl;

  @override
  String get key => jsObject.key;

  @override
  String get code => jsObject.key;

  @override
  bool get ctrlKey => jsObject.ctrlKey;

  @override
  bool get shiftKey => jsObject.shiftKey;

  @override
  bool get altKey => jsObject.altKey;

  @override
  bool get metaKey => jsObject.metaKey;

  @override
  bool get repeat => jsObject.repeat;
}
