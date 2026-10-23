import 'dart:io';

import 'check_result.dart';






Future<CheckResult> envCheck() async {
  final file = File('lib/core/config/app_config.dart');
  if (!file.existsSync()) return CheckResult.pass('env config');

  final problems = <String>[];
  final baseUrlLine = RegExp(r"baseUrl:\s*'([^']*)'");
  final source = file.readAsStringSync();

  for (final m in baseUrlLine.allMatches(source)) {
    final value = m.group(1) ?? '';
    if (value.isEmpty) {
      problems.add('an environment has an empty baseUrl');
    }
  }

  if (problems.isEmpty) return CheckResult.pass('env config');
  return CheckResult('env config', passed: false, messages: problems);
}
