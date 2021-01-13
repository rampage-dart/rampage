// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'node.dart';
import 'non_element_parent_node.dart';
import 'parent_node.dart';

/// The [DocumentFragment] interface represents a minimal document object that
/// has no parent.
///
/// It is used as a lightweight version of [Document] that stores a segment of a
/// document structure comprised of nodes just like a standard document. The key
/// difference is that because the document fragment isn't part of the active
/// document tree structure, changes made to the fragment don't affect the
/// document, cause reflow, or incur any performance impact that can occur when
/// changes are made.
abstract class DocumentFragment
    implements Node, ParentNode, NonElementParentNode {}
