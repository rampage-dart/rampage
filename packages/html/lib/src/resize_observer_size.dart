// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'dart:collection';
import 'dart:js_interop';

import 'package:meta/meta.dart';

import 'js_interop/resize_observer_size.dart' as js;

export 'js_interop/resize_observer_size.dart';

@internal
extension JSResizeObserverArray on JSArray<js.ResizeObserverSize> {
  List<js.ResizeObserverSize> get toDart {
    final list = <js.ResizeObserverSize>[];

    for (var i = 0; i < length; ++i) {
      list.add(this[i]);
    }

    return UnmodifiableListView(list);
  }
}
