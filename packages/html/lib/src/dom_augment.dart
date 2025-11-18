import 'dart:js_interop' as js;

import 'package:meta/meta.dart';
import 'package:rampage_js_interop/js_interop.dart' as js;

import 'dom.dart';
import 'html_augment.dart';
import 'js/wrapper.dart' as js;
import 'wrapper.dart';

@internal
JsWrapper<T> eventTargetFromJsObject<T extends js.EventTarget>(T jsObject) {
  assert(
    js.DartWrapper(jsObject).dartObject == null,
    'the jsObject should not be wrapped',
  );
  assert(
    jsObject.instanceOfString('EventTarget'),
    'the jsObject should be an EventTarget',
  );

  if (jsObject.instanceOfString('Node')) {
    return nodeFromJsObject<js.Node>(jsObject as js.Node) as JsWrapper<T>;
  } else {
    return EventTarget.fromJsObject(jsObject);
  }
}

@internal
JsWrapper<T> nodeFromJsObject<T extends js.Node>(T jsObject) {
  assert(
    js.DartWrapper(jsObject).dartObject == null,
    'the jsObject should not be wrapped',
  );
  assert(
    jsObject.instanceOfString('Node'),
    'the jsObject should be an EventTarget',
  );

  final nodeType = jsObject.nodeType;
  final constructor =
      switch (nodeType) {
            1 => elementFromJsObject,
            9 => Document.fromJsObject,
            11 => DocumentFragment.fromJsObject,
            _ => throw UnsupportedError('Unknown node type $nodeType'),
          }
          as JsWrapperConstructor<T>;

  return constructor(jsObject);
}

@internal
JsWrapper<T> elementFromJsObject<T extends js.Element>(T jsObject) {
  assert(
    js.DartWrapper(jsObject).dartObject == null,
    'the jsObject should not be wrapped',
  );
  assert(
    jsObject.instanceOfString('Element'),
    'the jsObject should be an EventTarget',
  );

  return jsObject.instanceOfString('HTMLElement')
      ? htmlElementFromJsObject(jsObject as js.HTMLElement) as JsWrapper<T>
      : throw UnsupportedError('');
}
