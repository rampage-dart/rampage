// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'element_from_js_object.dart';
import 'js/document.dart';

/// Creates an [Element] from the given [tagName].
T createElement<T extends Element>(String tag) =>
    safeElementFromObject(_documentCreateElement(tag)) as T;

JsObject createElementJsObject(String tag) =>
    JsObject.fromBrowserObject(_documentCreateElement(tag));

JsObject createSvgElementJsObject(String tag) => JsObject.fromBrowserObject(
      _documentCreateElementNS('http://www.w3.org/2000/svg', tag),
    );

Object _documentCreateElement(String tag) => _document.createElement(tag);

Object _documentCreateElementNS(String namespace, String tag) =>
    _document.createElementNS(namespace, tag);

JsObject get _document =>
    JsObject.fromBrowserObject(context['document'] as Object);
