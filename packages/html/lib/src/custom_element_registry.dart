// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js_interop';
import 'package:meta/meta.dart';

import 'custom_element.dart';
import 'js_interop/custom_element_registry.dart' as js;
import 'js_interop/html_element.dart' as js;
import 'wrapper.dart';

typedef CustomElementConstructor =
    CustomElement Function(js.HTMLElement jsObject);

class CustomElementRegistry extends JsWrapper<js.CustomElementRegistry> {
  factory CustomElementRegistry() {
    final jsObject = js.CustomElementRegistry();

    jsObject.connectedCallback = _connectedCallback.toJS;
    jsObject.disconnectedCallback = _disconnectedCallback.toJS;
    jsObject.attributeChangedCallback = _attributeChangedCallback.toJS;

    return CustomElementRegistry.fromJsObject(jsObject);
  }

  @protected
  CustomElementRegistry.fromJsObject(super.jsObject) : super.fromJsObject();

  void define(
    String name,
    CustomElementConstructor constructor, [
    List<String> attributes = const <String>[],
  ]) {
    final count = attributes.length;
    final jsAttributes = JSArray<JSString>.withLength(count);
    for (var i = 0; i < count; ++i) {
      jsAttributes[i] = attributes[i].toJS;
    }

    JSBoxedDartObject construct(js.HTMLElement jsObject) =>
        constructor(jsObject).toJSBox;

    jsObject.define(name, construct.toJS, jsAttributes);
  }
}

void _connectedCallback(JSBoxedDartObject object) {
  (object.toDart as CustomElement).connected();
}

void _disconnectedCallback(JSBoxedDartObject object) {
  (object.toDart as CustomElement).disconnected();
}

void _attributeChangedCallback(
  JSBoxedDartObject object,
  String name,
  String? oldValue,
  String? newValue,
) {
  (object.toDart as CustomElement).attributeChanged(name, oldValue, newValue);
}
