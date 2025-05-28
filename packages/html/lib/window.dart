// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

/// Contains everything exposed to a browser window.
library;

export 'dom.dart';
export 'src/body_element.dart';
export 'src/child_node.dart';
export 'src/div_element.dart';
export 'src/document.dart'
    hide safeDocumentFromObject, safeDocumentFromObjectNullable;
export 'src/document_fragment.dart'
    hide safeDocumentFragmentFromObject, safeDocumentFragmentFromObjectNullable;
export 'src/document_or_shadow_root.dart';
export 'src/element.dart'
    hide
        elementFromJsObject,
        safeElementFromJsObject,
        safeElementFromJsObjectNullable;
export 'src/html_element.dart'
    hide
        htmlElementFromJsObject,
        safeHtmlElementFromJsObject,
        safeHtmlElementFromJsObjectNullable;
export 'src/html_or_svg_element.dart';
export 'src/image_element.dart';
export 'src/node.dart' hide nodeFromJsObject;
export 'src/non_document_type_child_node.dart';
export 'src/non_element_parent_node.dart';
export 'src/parent_node.dart';
export 'src/shadow_root.dart'
    hide safeShadowRootFromObject, safeShadowRootFromObjectNullable;
export 'src/shadow_root_mode.dart' hide ShadowRootModeDartObject;
export 'src/slot_assignment_mode.dart' hide SlotAssignmentModeDartObject;
export 'src/slot_element.dart'
    hide safeSlotElementFromObject, safeSlotElementFromObjectNullable;
export 'src/slottable.dart';
export 'src/template_element.dart';
export 'src/window.dart'
    hide safeWindowFromObject, safeWindowFromObjectNullable;
