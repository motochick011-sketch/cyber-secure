enum Severity { error, warning }

class CheckResult {
  CheckResult(
    this.name, {
    required this.passed,
    this.messages = const [],
    this.severity = Severity.error,
  });

  final String name;
  final bool passed;
  final List<String> messages;
  final Severity severity;

  static CheckResult pass(String name) => CheckResult(name, passed: true);
}
