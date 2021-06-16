import 'dart:js';

import 'element.dart';
import 'html_element_from_js_object.dart';
import 'js/html_element.dart';
import 'svg_element_from_js_object.dart';
import 'wrapper.dart';

ElementImpl elementFromJsObject(JsObject jsObject) {
  assert(jsObject.dartObject == null, 'the jsObject should not be wrapped');

  return HtmlElementJsObject(jsObject).isInstanceOf
      ? htmlElementFromJsObject(jsObject)
      : svgElementFromJsObject(jsObject);
}

/// Safely retrieves or creates an instance of [ElementImpl] from the
/// [object].
ElementImpl safeElementFromObject(Object object) =>
    safeJsWrapperFromObject<ElementImpl>(object, elementFromJsObject);

/// Safely retrieves or creates an instance of [ElementImpl] from the
/// [object] if it is not `null`.
ElementImpl? safeElementFromObjectNullable(Object? object) =>
    safeJsWrapperFromObjectNullable<ElementImpl>(object, elementFromJsObject);
