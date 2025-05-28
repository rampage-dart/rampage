// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

part of 'html_element.dart';

@internal
HtmlElement<T> htmlElementFromJsObject<T extends js.HTMLElement>(T jsObject) {
  assert(
    js.DartWrapper(jsObject).dartObject == null,
    'the jsObject should not be wrapped',
  );

  final tagName = jsObject.tagName;
  return switch (tagName) {
        tag.div => DivElement.fromJsObject(jsObject as js.HTMLDivElement),
        tag.image => ImageElement.fromJsObject(jsObject as js.HTMLImageElement),
        tag.slot => SlotElement.fromJsObject(jsObject as js.HTMLSlotElement),
        tag.template => TemplateElement.fromJsObject(
          jsObject as js.HTMLTemplateElement,
        ),
        tag.body => BodyElement.fromJsObject(jsObject as js.HTMLBodyElement),

        _ => throw UnsupportedError('Unsupported $tagName element'),
      }
      as HtmlElement<T>;
}
