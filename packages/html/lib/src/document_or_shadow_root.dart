// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'js_interop/document_or_shadow_root.dart' as js;
import 'node.dart';

abstract mixin class DocumentOrShadowRoot<T extends js.DocumentOrShadowRoot>
    implements Node<T> {}
