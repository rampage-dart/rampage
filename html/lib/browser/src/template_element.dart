// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'element_factory.dart';
import 'element_tag.dart';
import 'html_element.dart';
import 'wrapper.dart';

/// Browser implementation of [TemplateElement].
class TemplateElementImpl extends HtmlElementImpl implements TemplateElement {
  /// Create an instance of [TemplateElementImpl].
  factory TemplateElementImpl() => TemplateElementImpl.fromJsObject(
        createElementJsObject(ElementTag.template),
      );

  /// Create an instance of [TemplateElementImpl] from the [jsObject].
  TemplateElementImpl.fromJsObject(JsObject jsObject)
      : super.fromJsObject(jsObject);

  /// Create an instance of [TemplateElementImpl] from the [jsObject].
  ///
  /// This constructor should be used when its unclear if the [jsObject] has
  /// already been wrapped.
  factory TemplateElementImpl.safeFromJsObject(JsObject jsObject) =>
      (jsObject.dartObject ?? TemplateElementImpl.fromJsObject(jsObject))
          as TemplateElementImpl;

  @override
  DocumentFragment get content =>
      throw UnimplementedError('content not implemented');
}
