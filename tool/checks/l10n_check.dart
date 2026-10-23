import 'dart:convert';
import 'dart:io';

import 'check_result.dart';

Future<CheckResult> l10nCheck() async {
  final dir = Directory('lib/l10n/arb');
  if (!dir.existsSync()) return CheckResult.pass('l10n completeness');

  final arbs = dir
      .listSync()
      .whereType<File>()
      .where((f) => f.path.endsWith('.arb'))
      .toList();

  if (arbs.isEmpty) {
    return CheckResult(
      'l10n completeness',
      passed: true,
      messages: const ['(no ARB files yet — l10n not wired)'],
    );
  }

  
  final base = arbs.firstWhere(
    (f) => f.path.endsWith('app_en.arb') || f.path.endsWith('en.arb'),
    orElse: () => arbs.first,
  );

  Set<String> keysOf(File f) {
    final map = jsonDecode(f.readAsStringSync()) as Map<String, dynamic>;
    return map.keys
        .where((k) => !k.startsWith('@'))
        .toSet(); 
  }

  final baseKeys = keysOf(base);
  final problems = <String>[];

  for (final arb in arbs) {
    if (arb.path == base.path) continue;
    final keys = keysOf(arb);
    final missing = baseKeys.difference(keys);
    final extra = keys.difference(baseKeys);
    final name = arb.uri.pathSegments.last;
    for (final m in missing) {
      problems.add('$name missing key "$m"');
    }
    for (final e in extra) {
      problems.add('$name has stale key "$e" (not in base)');
    }
  }

  if (problems.isEmpty) return CheckResult.pass('l10n completeness');
  return CheckResult('l10n completeness', passed: false, messages: problems);
}
