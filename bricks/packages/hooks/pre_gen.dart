import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  if (context.vars['uses_shared_preferences']) {
    final progress = context.logger.progress('Installing packages');

    await Process.run('flutter', [
      'pub',
      'add',
      'shared_preferences',
      'get_it',
      'injectable',
      'flutter_bloc',
      'dio',
      'freezed',
      'freezed_annotation',
      'dartz',
    ]);

    // dev dependencies
    await Process.run('flutter', [
      'pub',
      'add',
      'build_runner',
      'injectable_generator',
      '--dev',
    ]);

    await Process.run('flutter', ['pub', 'get', 'shared_preferences']);

    progress.complete();
  }
}
