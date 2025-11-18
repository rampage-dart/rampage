import 'package:rampage_js_interop/js_interop.dart' as js;

import 'html.dart';
import 'js/wrapper.dart' as js;
import 'wrapper.dart';

JsWrapper<T> htmlElementFromJsObject<T extends js.HTMLElement>(T jsObject) {
  assert(
    js.DartWrapper(jsObject).dartObject == null,
    'the jsObject should not be wrapped',
  );

  final constructor =
      switch (jsObject.tagName) {
            'DIV' => HTMLDivElement.fromJsObject,
            'IMAGE' => HTMLImageElement.fromJsObject,
            'SLOT' => HTMLSlotElement.fromJsObject,
            'TEMPLATE' => HTMLTemplateElement.fromJsObject,
            'BODY' => HTMLBodyElement.fromJsObject,
            'HEAD' => HTMLHeadElement.fromJsObject,
            'SCRIPT' => HTMLScriptElement.fromJsObject,
            _ => HTMLUnknownElement.fromJsObject,
          }
          as JsWrapperConstructor<T>;

  return constructor(jsObject);
}
