// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_html/html.dart';

import 'document_fragment_from_js_object.dart';
import 'element_factory.dart';
import 'element_tag.dart';
import 'html_element.dart';
import 'js/template_element.dart';

/// Browser implementation of [TemplateElement].
class TemplateElementImpl extends HtmlElementImpl implements TemplateElement {
  /// Create an instance of [TemplateElementImpl].
  factory TemplateElementImpl() => TemplateElementImpl.fromJsObject(
        createElementJsObject(ElementTag.template),
      );

  /// Create an instance of [TemplateElementImpl] from the [jsObject].
  TemplateElementImpl.fromJsObject(super.jsObject) : super.fromJsObject();

  @override
  DocumentFragment get content =>
      safeDocumentFragmentFromObject(jsObject.content);
}
