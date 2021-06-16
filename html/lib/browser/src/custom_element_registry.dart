// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'custom_element.dart';
import 'wrapper.dart';

/// Browser implementation of [CustomElementRegistry].
class CustomElementRegistryImpl extends JsWrapper
    implements CustomElementRegistry {
  /// Create an instance of [CustomElementRegistryImpl].
  factory CustomElementRegistryImpl() {
    final registry = JsObject(context['CustomElementInterop'] as JsFunction);

    registry['connectedCallback'] = JsFunction.withThis(_connectedCallback);
    registry['disconnectedCallback'] =
        JsFunction.withThis(_disconnectedCallback);
    registry['attributeChangedCallback'] =
        JsFunction.withThis(_attributeChangedCallback);

    return CustomElementRegistryImpl.fromJsObject(registry);
  }

  /// Create an instance of [CustomElementRegistryImpl] from the [jsObject].
  CustomElementRegistryImpl.fromJsObject(JsObject jsObject)
      : super.fromJsObject(jsObject);

  @override
  void define(
    String name,
    CustomElementConstructor constructor, [
    List<String>? attributes,
  ]) {
    HtmlElement construct(Object? scope, Object object) =>
        constructor(JsObject.fromBrowserObject(object));

    jsObject.define(
      name,
      JsFunction.withThis(construct),
      attributes != null ? JsArray<String>.from(attributes) : JsArray<String>(),
    );
  }

  @override
  bool isDefined(String name) => jsObject.isDefined(name);
}

extension on JsObject {
  bool isDefined(String name) =>
      callMethod('isDefined', <Object>[name]) as bool;
  void define(String name, JsFunction construct, JsArray<String> attributes) {
    callMethod('define', <Object>[name, construct, attributes]);
  }
}

void _connectedCallback(Object? scope, CustomElementImpl element) {
  element.connected();
}

void _disconnectedCallback(Object? scope, CustomElementImpl element) {
  element.disconnected();
}

void _attributeChangedCallback(
  Object? scope,
  CustomElementImpl element,
  String name,
  String? oldValue,
  String? newValue,
) {
  element.attributeChanged(name, oldValue, newValue);
}
