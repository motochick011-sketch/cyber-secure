import 'dart:io';

Future<void> main(List<String> args) async {
  stdout.writeln('▶ regenerating launcher icons…');
  await _run('dart', ['run', 'flutter_launcher_icons']);

  stdout.writeln('▶ regenerating native splash…');
  await _run('dart', ['run', 'flutter_native_splash:create']);

  stdout.writeln('✅ icons + splash regenerated');
}

Future<void> _run(String cmd, List<String> args) async {
  final p = await Process.start(cmd, args, mode: ProcessStartMode.inheritStdio);
  final code = await p.exitCode;
  if (code != 0) {
    stderr.writeln('❌ `$cmd ${args.join(' ')}` failed (exit $code)');
    exit(code);
  }
}
