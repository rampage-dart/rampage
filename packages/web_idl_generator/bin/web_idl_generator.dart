// Copyright (c) 2025 the Rampage Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

import 'package:args/command_runner.dart';
import 'package:rampage_web_idl_generator/generator.dart';

Future<void> main(List<String> args) async {
  final runner = CommandRunner<void>('web_idl_generator', 'do stuff')
    ..addCommand(DartGeneratorCommand())
    ..addCommand(JsInteropGeneratorCommand());

  runner.argParser.addOption(
    'output',
    abbr: 'o',
    help: 'set the output directory',
  );

  await runner.run(args);
}
