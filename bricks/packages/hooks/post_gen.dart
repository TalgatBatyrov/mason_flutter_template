import 'dart:io';

import 'package:mason/mason.dart';
import 'package:path/path.dart' as path;

void run(HookContext context) async {
  final progress = context.logger.progress('Installing packages');

  await Process.run('flutter', ['pub', 'add', 'flutter_native_splash']);
  await Process.run('flutter', ['pub', 'get', 'flutter_native_splash']);

  progress.complete();
}
