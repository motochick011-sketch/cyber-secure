import 'dart:io';

import 'check_result.dart';

Future<CheckResult> themeCheck() async {
  final libDir = Directory('lib');
  if (!libDir.existsSync()) return CheckResult.pass('theme hygiene');

  final colorViolations = <String>[];
  final styleViolations = <String>[];
  final textWarnings = <String>[];

  final rawColor = RegExp(r'Color\(0x|Colors\.[a-zA-Z]');
  final inlineStyle = RegExp(r'TextStyle\(');
  final literalText = RegExp(r'''Text\(\s*['"]''');

  for (final file
      in libDir
          .listSync(recursive: true)
          .whereType<File>()
          .where((f) => f.path.endsWith('.dart'))) {
    final path = file.path;

    final isPalette = path.contains('/theme/palettes/');
    final isGenerated =
        path.endsWith('.g.dart') || path.endsWith('.freezed.dart');

    final isThemeData =
        path.contains('/design_system/theme/') && !path.contains('/widgets/');
    if (isPalette || isGenerated || isThemeData) continue;

    final lines = file.readAsLinesSync();
    for (var i = 0; i < lines.length; i++) {
      final line = lines[i];
      if (line.trimLeft().startsWith('//')) continue; // skip comments
      final loc = '$path:${i + 1}';
      if (rawColor.hasMatch(line)) colorViolations.add(loc);
      if (inlineStyle.hasMatch(line)) styleViolations.add(loc);
      if (literalText.hasMatch(line)) textWarnings.add(loc);
    }
  }

  final hardFail = colorViolations.isNotEmpty || styleViolations.isNotEmpty;

  final messages = <String>[
    for (final v in colorViolations) 'raw color (use colors.*): $v',
    for (final v in styleViolations) 'inline TextStyle (use styles.*): $v',
    if (textWarnings.isNotEmpty)
      'WARN: ${textWarnings.length} unlocalized Text(...) — review (API text is OK)',
  ];

  if (!hardFail) {
    return CheckResult(
      'theme hygiene',
      passed: textWarnings.isEmpty,
      messages: messages,
      severity: Severity.warning,
    );
  }
  return CheckResult('theme hygiene', passed: false, messages: messages);
}
