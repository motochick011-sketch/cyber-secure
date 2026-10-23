import 'package:cybersecure/core/cubit/view_state.dart';
import 'package:cybersecure/features/profile/domains/models/user_achievement.dart';
import 'package:cybersecure/features/profile/domains/models/user_learning_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
abstract class ProfileData with _$ProfileData {
  const factory ProfileData({@Default([]) List<UserAchievement> achievements, UserLearningStatus? learningStatus}) = _ProfileData;
}

typedef ProfileState = ViewState<ProfileData>;
