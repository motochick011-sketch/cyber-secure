import 'package:cybersecure/core/platform/platform_service.dart';

enum QuizCategory {
  phishing('Phishing'),
  passwordSecurity('Password Security'),
  malware('Malware'),
  safeBrowsing('Safe Browsing'),
  socialEngineering('Social Engineering'),
  mobileSecurity('Mobile Security');

  final String displayName;

  const QuizCategory(this.displayName);

  static QuizCategory? fromString(String? value) {
    return PlatformService.enumFromString(value?.toLowerCase(), QuizCategory.values);
  }
}
