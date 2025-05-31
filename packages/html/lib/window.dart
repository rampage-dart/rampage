// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

/// Contains everything exposed to a browser window.
library;

export 'dom.dart';
export 'src/body_element.dart';
export 'src/child_node.dart';
export 'src/custom_element.dart';
export 'src/custom_element_registry.dart';
export 'src/div_element.dart';
export 'src/document.dart'
    hide safeDocumentFromJsObject, safeDocumentFromJsObjectNullable;
export 'src/document_fragment.dart'
    hide
        safeDocumentFragmentFromJsObject,
        safeDocumentFragmentFromJsObjectNullable;
export 'src/document_or_shadow_root.dart';
export 'src/dom_parser.dart';
export 'src/dom_parser_supported_type.dart'
    hide DomParserSupportedTypeDartObject;
export 'src/element.dart'
    hide
        elementFromJsObject,
        safeElementFromJsObject,
        safeElementFromJsObjectNullable;
export 'src/focus_event.dart';
export 'src/html_element.dart'
    hide
        htmlElementFromJsObject,
        safeHtmlElementFromJsObject,
        safeHtmlElementFromJsObjectNullable;
export 'src/html_or_svg_element.dart';
export 'src/image_element.dart';
export 'src/keyboard_event.dart';
export 'src/mouse_event.dart';
export 'src/node.dart' hide nodeFromJsObject;
export 'src/non_document_type_child_node.dart';
export 'src/non_element_parent_node.dart';
export 'src/parent_node.dart';
export 'src/shadow_root.dart'
    hide safeShadowRootFromJsObject, safeShadowRootFromJsObjectNullable;
export 'src/shadow_root_mode.dart' hide ShadowRootModeDartObject;
export 'src/slot_assignment_mode.dart' hide SlotAssignmentModeDartObject;
export 'src/slot_element.dart'
    hide safeSlotElementFromJsObject, safeSlotElementFromJsObjectNullable;
export 'src/slottable.dart';
export 'src/template_element.dart';
export 'src/ui_event.dart' hide uiEventFromJsObject;
export 'src/wheel_event.dart';
export 'src/window.dart'
    hide safeWindowFromJsObject, safeWindowFromJsObjectNullable;
