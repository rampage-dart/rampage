import 'dart:js';

JsObject? fromBrowserObjectNullable(Object? object) =>
    object != null ? JsObject.fromBrowserObject(object) : null;
