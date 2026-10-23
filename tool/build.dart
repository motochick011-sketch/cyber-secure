import 'dart:io';

import 'checks/asset_check.dart';
import 'checks/check_result.dart';
import 'checks/env_check.dart';
import 'checks/l10n_check.dart';
import 'checks/route_check.dart';
import 'checks/theme_check.dart';

Future<void> main(List<String> args) async {
  final genOnly = args.contains('--gen-only');
  final ci = args.contains('--ci');

  stdout.writeln('▶ build pipeline${ci ? ' (ci)' : ''}');

  
  await _run('dart', ['run', 'build_runner', 'build']);
  if (genOnly) {
    stdout.writeln('✅ codegen done (--gen-only)');
    return;
  }
  
  final results = <CheckResult>[
    await l10nCheck(),
    await assetCheck(),
    await routeCheck(),
    await themeCheck(),
    await envCheck(),
  ];

  final failures = results.where((r) => !r.passed).toList();
  for (final r in results) {
    stdout.writeln('${r.passed ? '✓' : '✗'} ${r.name}');
    for (final msg in r.messages) {
      stdout.writeln('    $msg');
    }
  }
  
  final toolFailed = <String>[];
  final toolWarnings = <String>[];

  if (!await _runOk('flutter', ['analyze'])) toolFailed.add('analyze');

  
  
  if (await _formatChangedFiles()) {
    toolWarnings.add('format (files were reformatted)');
  }

  if (!await _runOk('flutter', ['test'])) toolFailed.add('test');

  
  final hardFailures = [
    ...failures.where((f) => f.severity == Severity.error).map((f) => f.name),
    ...toolFailed,
  ];
  if (hardFailures.isNotEmpty) {
    stderr.writeln('\n❌ FAILED: ${hardFailures.join(', ')}');
    exit(1);
  }
  final warnings = [
    ...failures.where((f) => f.severity == Severity.warning).map((w) => w.name),
    ...toolWarnings,
  ];
  if (warnings.isNotEmpty) {
    stdout.writeln('\n⚠ passed with warnings: ${warnings.join(', ')}');
  } else {
    stdout.writeln('\n✅ all checks passed');
  }
}



Future<bool> _formatChangedFiles() async {
  stdout.writeln('▶ dart format .');
  final result = await Process.run('dart', ['format', '.']);
  stdout.write(result.stdout);
  
  final out = result.stdout.toString();
  final match = RegExp(r'\((\d+) changed\)').firstMatch(out);
  final changed = match != null && int.parse(match.group(1)!) > 0;
  return changed;
}

Future<void> _run(String cmd, List<String> args) async {
  final result = await Process.start(
    cmd,
    args,
    mode: ProcessStartMode.inheritStdio,
  );
  final code = await result.exitCode;
  if (code != 0) {
    stderr.writeln('❌ `$cmd ${args.join(' ')}` failed (exit $code)');
    exit(code);
  }
}

Future<bool> _runOk(String cmd, List<String> args) async {
  stdout.writeln('▶ $cmd ${args.join(' ')}');
  final result = await Process.start(
    cmd,
    args,
    mode: ProcessStartMode.inheritStdio,
  );
  return (await result.exitCode) == 0;
}
