// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:js';

import 'package:rampage_html/html.dart';

import 'custom_element_registry.dart';
import 'document.dart';
import 'event_target.dart';
import 'global_event_handlers.dart';
import 'js/window.dart';
import 'wrapper.dart';

/// Browser implementation of [Window].
class WindowImpl extends EventTargetImpl
    with GlobalEventHandlersImpl
    implements Window {
  /// Create an instance of [WindowImpl] from the [jsObject].
  WindowImpl.fromJsObject(JsObject jsObject) : super.fromJsObject(jsObject);

  @override
  late final CustomElementRegistry customElements = CustomElementRegistryImpl();

  @override
  late final Document document = safeDocumentFromObject(jsObject.document);
}

// \TODO Remove if constructor tear-offs are added to the language
WindowImpl _constructor(JsObject jsObject) => WindowImpl.fromJsObject(jsObject);

/// Safely retrieves or creates an instance of [WindowImpl] from the [object].
WindowImpl safeWindowFromObject(Object object) =>
    safeJsWrapperFromObject<WindowImpl>(object, _constructor);

/// Safely retrieves or creates an instance of [WindowImpl] from the [object] if
/// it is not `null`.
WindowImpl? safeWindowFromObjectNullable(Object? object) =>
    safeJsWrapperFromObjectNullable<WindowImpl>(object, _constructor);

/// The [Window] object.
Window get window => safeWindowFromObject(context['window'] as Object);
