import 'dart:io';

import 'package:mason/mason.dart';
import 'package:path/path.dart' as path;

void run(HookContext context) async {
  if (context.vars['uses_state_management']) {
    final progress = context.logger.progress('Installing packages');

    await Process.run('flutter', ['pub', 'add', 'flutter_bloc']);
    await Process.run('flutter', ['pub', 'get', 'flutter_bloc']);

    final generator = await MasonGenerator.fromBrick(
      Brick.version(name: 'bloc', version: 'any'),
    );

    final destination = Directory(
      path.join(
        Directory.current.path,
        'lib',
        'feature',
        (context.vars['feature_name'] as String).snakeCase,
        'presentation',
        'BLoCs',
        (context.vars['bloc_name'] as String).snakeCase,
      ),
    );

    final generatorTarget = DirectoryGeneratorTarget(destination);

    var blocContextVariables = {
      'name': context.vars['bloc_name'],
      // basic, equatable, freezed
      'style': 'freezed',
    };

    await generator.hooks.preGen(
      workingDirectory: destination.path,
      vars: blocContextVariables,
      onVarsChanged: (vars) {
        blocContextVariables = vars;
      },
    );

    final files = await generator.generate(
      generatorTarget,
      vars: blocContextVariables,
      fileConflictResolution: FileConflictResolution.overwrite,
    );

    for (final file in files) {
      context.logger.info('Generated ${file.path} :: ${file.status}');
    }
    progress.complete();
  }
}
