// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:meta/meta.dart';

import 'document_fragment.dart';
import 'html_element.dart';
import 'js_interop/template_element.dart' as js;

final class TemplateElement extends HtmlElement<js.HTMLTemplateElement> {
  @protected
  TemplateElement.fromJsObject(super.jsObject) : super.fromJsObject();

  DocumentFragment get content =>
      safeDocumentFragmentFromObject(jsObject.content);
}
