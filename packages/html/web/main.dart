// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:rampage_html/html.dart';

class ClickCounter extends CustomElement {
  factory ClickCounter() => Element.tag('click-counter') as ClickCounter;

  ClickCounter.fromJsObject(super.jsObject) : super.fromJsObject();

  int clicks = 0;

  static void define() {
    customElements.define('click-counter', ClickCounter.fromJsObject);
  }
}

Future<void> main() async {
  ClickCounter.define();

  final counter = ClickCounter();

  print('Clicks : ${counter.clicks}');
}
