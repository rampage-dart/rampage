// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:meta/meta.dart';

import 'element.dart';
import 'html_or_svg_element.dart';
import 'js_interop/html_element.dart' as js;
import 'wrapper.dart';

// FIXME: https://github.com/dart-lang/sdk/issues/56204
// ignore: directives_ordering
import 'js_interop/wrapper.dart' as js;

part 'html_element_augment.dart';

class HtmlElement<T extends js.HTMLElement> extends Element<T>
    with HtmlOrSvgElement<T> {
  @protected
  HtmlElement.fromJsObject(super.jsObject) : super.fromJsObject();

  String get innerText => jsObject.innerText;
  set innerText(String value) {
    jsObject.innerText = value;
  }

  void click() {
    jsObject.click();
  }
}

@internal
HtmlElement<T> safeHtmlElementFromJsObject<T extends js.HTMLElement>(
  T jsObject,
) =>
    safeJsWrapperFromJsObject<T>(jsObject, htmlElementFromJsObject)
        as HtmlElement<T>;

@internal
HtmlElement<T>? safeHtmlElementFromJsObjectNullable<T extends js.HTMLElement>(
  T? jsObject,
) =>
    safeJsWrapperFromJsObjectNullable<T>(jsObject, htmlElementFromJsObject)
        as HtmlElement<T>;
