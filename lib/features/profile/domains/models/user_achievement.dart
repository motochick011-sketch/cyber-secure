import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

part 'user_achievement.freezed.dart';

enum AchievementIcon {
  footprints('footprints', LucideIcons.footprints),
  star('star', LucideIcons.star),
  trophy('trophy', LucideIcons.trophy),
  medal('medal', LucideIcons.medal),
  award('award', LucideIcons.award),
  target('target', LucideIcons.target),
  flag('flag', LucideIcons.flag),
  rocket('rocket', LucideIcons.rocket),
  graduation('graduation-cap', LucideIcons.graduationCap),
  bookOpen('book-open', LucideIcons.bookOpen),
  brain('brain', LucideIcons.brain),
  lightbulb('lightbulb', LucideIcons.lightbulb),
  checkCheck('check-check', LucideIcons.checkCheck),
  listChecks('list-checks', LucideIcons.listChecks),
  flame('flame', LucideIcons.flame),
  zap('zap', LucideIcons.zap),
  calendarCheck('calendar-check', LucideIcons.calendarCheck),
  shield('shield', LucideIcons.shield),
  shieldCheck('shield-check', LucideIcons.shieldCheck),
  lock('lock', LucideIcons.lock),
  key('key', LucideIcons.key),
  fingerprint('fingerprint', LucideIcons.fingerprint),
  fishOff('fish-off', LucideIcons.fishOff),
  bug('bug', LucideIcons.bug),
  eye('eye', LucideIcons.eye);

  const AchievementIcon(this.value, this.iconData);

  final String value;
  final IconData iconData;

  static AchievementIcon fromString(String value) {
    return AchievementIcon.values.firstWhere((icon) => icon.value == value, orElse: () => AchievementIcon.star);
  }
}

@freezed
abstract class UserAchievement with _$UserAchievement {
  const factory UserAchievement({required int id, required String title, required String description, required String image}) = _UserAchievement;
}
