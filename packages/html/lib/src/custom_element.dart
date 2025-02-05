// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';

import 'package:meta/meta.dart';
import 'package:web/web.dart' as js
    hide CustomElementConstructor, CustomElementRegistry;

import 'element.dart';
import 'js/custom_element_registry.dart' as js;
import 'wrapper.dart';

class CustomElement extends Element<js.HTMLElement> {
  /// Creates a [CustomElement] from a [jsObject].
  ///
  /// This should never be called outside of generated code.
  CustomElement.fromJsObject(super.jsObject) : super.fromJsObject();

  /// Callback for when the [CustomElement] is connected.
  @protected
  void connected() {}

  /// Callback for when the [CustomElement] is disconnected.
  @protected
  void disconnected() {}

  /// Callback for when the attribute changes its value.
  @protected
  void attributeChanged(String name, String? oldValue, String? newValue) {}
}

typedef CustomElementConstructor = CustomElement Function(js.HTMLElement object);

/// The [CustomElementRegistry] interface provides methods for registering
/// [CustomElement]s and querying registered elements.
///
/// To get an instance of it, use the [Window.customElements] property.
class CustomElementRegistry extends JsWrapper<js.CustomElementRegistry> {
  /// Creates a [CustomElementRegistry] from a [jsObject].
  ///
  /// This should never be called outside of generated code.
  CustomElementRegistry.fromJsObject(super.jsObject) : super.fromJsObject() {
    jsObject
      ..connectedCallback = _connectedCallback.toJS
      ..disconnectedCallback = _disconnectedCallback.toJS
      ..attributeChangedCallback = _attributeChangedCallback.toJS;
  }

  /// Defines a new [CustomElement].
  void define(
    String name,
    CustomElementConstructor constructor, [
    List<String> attributes = const <String>[],
  ]) {
    JSBoxedDartObject? construct(js.HTMLElement jsObject) =>
        constructor(jsObject).toJSBox;

    final jsAttributes = attributes.map((s) => s.toJS).toList();
    jsObject.define(name, construct.toJS, jsAttributes.toJS);
  }

  static void _connectedCallback(JSBoxedDartObject element) {
    (element.toDart as CustomElement).connected();
  }

  static void _disconnectedCallback(JSBoxedDartObject element) {
    (element.toDart as CustomElement).disconnected();
  }

  static void _attributeChangedCallback(
    JSBoxedDartObject element,
    String name,
    String? oldValue,
    String? newValue,
  ) {
    (element.toDart as CustomElement)
        .attributeChanged(name, oldValue, newValue);
  }
}

final customElements = CustomElementRegistry.fromJsObject(js.CustomElementRegistry());
