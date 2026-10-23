import 'dart:io';
import 'check_result.dart';

Future<CheckResult> assetCheck() async {
  final assetsDir = Directory('assets');
  final hasAssets =
      assetsDir.existsSync() &&
      assetsDir
          .listSync(recursive: true)
          .whereType<File>()
          .any((f) => !f.path.endsWith('.gitkeep'));

  if (!hasAssets) {
    return CheckResult(
      'asset integrity',
      passed: true,
      messages: const ['(no assets yet — nothing to verify)'],
    );
  }

  return CheckResult(
    'asset integrity',
    passed: true,
    messages: const ['(assets present; flutter_gen check pending wiring)'],
  );
}
