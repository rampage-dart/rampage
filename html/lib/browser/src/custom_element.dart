// Copyright (c) 2019 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

@JS()
library rampage_html.browser.src.custom_element;

import 'dart:js' as js;

import 'package:js/js.dart';
import 'package:rampage_browser_interop/browser_interop.dart' as interop;
import 'package:rampage_html/html.dart';

import 'element.dart';

//-----------------------------------------------------------
// CustomElement
//-----------------------------------------------------------

/// Browser implementation of [CustomElement].
class CustomElementImpl extends HtmlElementImpl implements CustomElement {
  /// Create an instance of [CustomElementImpl] from the [jsObject].
  CustomElementImpl.fromJsObject(interop.HtmlElement jsObject)
      : super.fromJsObject(jsObject);

  /// Callback for when the [CustomElement] is connected.
  @override
  void connected() {}

  /// Callback for when the [CustomElement] is disconnected.
  @override
  void disconnected() {}

  @override
  void attributeChanged(String name, String oldValue, String newValue) {}
}

//-----------------------------------------------------------
// CustomElementRegistry
//-----------------------------------------------------------

@JS('CustomElementInterop')
class _CustomElementInterop {
  external factory _CustomElementInterop();

  external Function get connectedCallback;
  external set connectedCallback(Function value);

  external Function get disconnectedCallback;
  external set disconnectedCallback(Function value);

  external Function get attributeChangedCallback;
  external set attributeChangedCallback(Function value);

  external void define(
    String name,
    Function construct,
    List<String> attributes,
  );
  external bool isDefined(String name);
}

void _connectedCallback(CustomElementImpl element) {
  element.connected();
}

void _disconnectedCallback(CustomElementImpl element) {
  element.disconnected();
}

void _attributeChangedCallback(
  CustomElementImpl element,
  String name,
  String oldValue,
  String newValue,
) {
  element.attributeChanged(name, oldValue, newValue);
}

/// Browser implementation of [CustomElementRegistry].
class CustomElementRegistryImpl implements CustomElementRegistry {
  /// Create an instance of [CustomElementRegistryImpl].
  CustomElementRegistryImpl() : _jsObject = _CustomElementInterop() {
    _jsObject
      ..connectedCallback = js.allowInterop(_connectedCallback)
      ..disconnectedCallback = js.allowInterop(_disconnectedCallback)
      ..attributeChangedCallback = js.allowInterop(_attributeChangedCallback);
  }

  final _CustomElementInterop _jsObject;

  @override
  void define(String name, Function construct, [List<String> attributes]) {
    _jsObject.define(
      name,
      js.allowInterop(construct),
      attributes ?? <String>[],
    );
  }

  @override
  bool isDefined(String name) => _jsObject.isDefined(name);
}
