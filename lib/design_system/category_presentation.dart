import 'package:cybersecure/core/domain/category.dart';
import 'package:flutter/widgets.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

extension QuizCategoryPresentation on QuizCategory {
  IconData get icon {
    switch (this) {
      case QuizCategory.phishing:
        return LucideIcons.fish;
      case QuizCategory.passwordSecurity:
        return LucideIcons.key;
      case QuizCategory.malware:
        return LucideIcons.bug;
      case QuizCategory.safeBrowsing:
        return LucideIcons.globe;
      case QuizCategory.socialEngineering:
        return LucideIcons.users;
      case QuizCategory.mobileSecurity:
        return LucideIcons.smartphone;
    }
  }

  String get blurb {
    switch (this) {
      case QuizCategory.phishing:
        return "Emails, links & scams";
      case QuizCategory.passwordSecurity:
        return "Strong passwords & MFA";
      case QuizCategory.malware:
        return "Viruses & ransomware";
      case QuizCategory.safeBrowsing:
        return "Websites & downloads";
      case QuizCategory.socialEngineering:
        return "How attackers manipulate people";
      case QuizCategory.mobileSecurity:
        return "Keep your phone protected";
    }
  }
}
