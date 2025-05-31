// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:meta/meta.dart';

import 'custom_element_registry.dart';
import 'document.dart';
import 'event_target.dart';
import 'global_event_handlers.dart';
import 'js_interop/window.dart' as js;
import 'wrapper.dart';

final class Window extends EventTarget<js.Window>
    with GlobalEventHandlers<js.Window> {
  @protected
  Window.fromJsObject(super.jsObject) : super.fromJsObject();

  late final CustomElementRegistry customElements = CustomElementRegistry();

  late final Document document = safeDocumentFromObject(jsObject.document);
}

@internal
Window safeWindowFromObject(js.Window jsObject) =>
    safeJsWrapperFromJsObject<js.Window>(jsObject, Window.fromJsObject)
        as Window;

@internal
Window? safeWindowFromObjectNullable(js.Window? jsObject) =>
    safeJsWrapperFromJsObjectNullable<js.Window>(jsObject, Window.fromJsObject)
        as Window;

final Window window = safeWindowFromObject(js.window);
