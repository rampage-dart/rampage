// Copyright (c) 2021 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_html/html.dart';

import 'components.dart' deferred as components;

abstract class ClickCounter implements CustomElement {
  factory ClickCounter() => Element.tag('click-counter') as ClickCounter;

  int get clicks;
}

Future<void> main() async {
  await components.loadLibrary();
  components.define();

  final counter = ClickCounter();

  window.document.body!.append(counter);

  counter.onClick.listen((event) {
    print('The counter was clicked ${counter.clicks} times');
    print('The counter was clicked at mouse coordinates '
        '(${event.screenX}, ${event.screenY})');
  });
}
