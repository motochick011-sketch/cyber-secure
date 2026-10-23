import 'package:flutter/widgets.dart';

@immutable
class AppColors {
  const AppColors({
    required this.primary,
    required this.secondary,
    required this.onPrimary,
    required this.background,
    required this.surface,
    required this.textPrimary,
    required this.textSecondary,
    required this.border,
    required this.error,
    required this.success,
    required this.warning,
    required this.selected,
    required this.disabled,
  });

  final Color primary;
  final Color secondary;
  final Color onPrimary;
  final Color background;
  final Color surface;
  final Color textPrimary;
  final Color textSecondary;
  final Color border;
  final Color error;
  final Color success;
  final Color warning;

  final Color selected;

  final Color disabled;

  LinearGradient get primaryGradient => LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [primary, secondary]);

  Color get primaryTint => primary.withValues(alpha: 0.06);

  Color get overlayBase => background.computeLuminance() < 0.5 ? const Color(0xFFFFFFFF) : const Color(0xFF000000);

  Color get overlaySubtle => overlayBase.withValues(alpha: 0.02);

  Color get overlayFaint => overlayBase.withValues(alpha: 0.06);

  Color get overlayLight => overlayBase.withValues(alpha: 0.12);

  Color get overlayMuted => overlayBase.withValues(alpha: 0.20);

  Color get overlayStrong => overlayBase.withValues(alpha: 0.50);
}
