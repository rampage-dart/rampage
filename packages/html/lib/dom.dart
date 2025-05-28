// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

/// Additional DOM definitions are present in `window.dart`.
library;

export 'src/abort_signal.dart';
export 'src/event.dart';
export 'src/event_target.dart'
    hide
        eventTargetFromJsObject,
        safeEventTargetFromJsObject,
        safeEventTargetFromJsObjectNullable;
