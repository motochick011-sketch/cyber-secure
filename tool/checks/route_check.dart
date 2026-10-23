import 'dart:io';

import 'check_result.dart';







Future<CheckResult> routeCheck() async {
  final screenIdFile = File('lib/core/navigation/screen_id.dart');
  final routerFile = File('lib/core/navigation/app_router.dart');
  if (!screenIdFile.existsSync() || !routerFile.existsSync()) {
    return CheckResult.pass('route registry');
  }

  final idSource = screenIdFile.readAsStringSync();
  final routerSource = routerFile.readAsStringSync();

  
  
  final entryNames = RegExp(
    r'^\s*([a-z][a-zA-Z0-9]*)\s*\(\s*\n?\s*path:',
    multiLine: true,
  ).allMatches(idSource).map((m) => m.group(1)!).toSet();

  final orphans = <String>[];
  for (final name in entryNames) {
    
    if (!routerSource.contains('ScreenId.$name.path')) {
      orphans.add(name);
    }
  }

  if (orphans.isEmpty) {
    return CheckResult.pass('route registry');
  }
  return CheckResult(
    'route registry',
    passed: false,
    messages: [
      for (final o in orphans)
        'ScreenId.$o has no wired route in app_router.dart (orphan)',
    ],
  );
}
