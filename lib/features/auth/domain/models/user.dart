import 'package:cybersecure/core/platform/platform_service.dart';
import 'package:cybersecure/design_system/theme/theme_access.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

enum UserLevel {
  beginner('Beginner'),
  intermediate('Intermediate'),
  pro('Pro');

  final String displayName;

  const UserLevel(this.displayName);

  static UserLevel? fromString(String? value) {
    return PlatformService.enumFromString(value?.toLowerCase(), UserLevel.values);
  }

  Color get color => switch (this) {
    UserLevel.beginner => appColors.success,
    UserLevel.intermediate => appColors.warning,
    UserLevel.pro => appColors.primary,
  };
}

@freezed
abstract class User with _$User {
  const factory User({required String id, required String email, required String name, String? avatarUrl, String? lastName, String? phone, DateTime? createdAt, UserLevel? level}) = _User;
}
