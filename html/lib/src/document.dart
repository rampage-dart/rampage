// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'document_or_shadow_root.dart';
import 'element.dart';
import 'html_element.dart';
import 'node.dart';
import 'non_element_parent_node.dart';
import 'parent_node.dart';

/// The [Document] interface represents any web page loaded in the browser and
/// serves as an entry point into the web page's content, which is the DOM tree.
abstract class Document
    implements Node, ParentNode, NonElementParentNode, DocumentOrShadowRoot {
  /// Represents the body of the current [Document], or `null` if no such
  /// [Element] exists.
  HtmlElement? get body;
  set body(HtmlElement? value);
}
