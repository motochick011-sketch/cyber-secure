import 'package:cybersecure/core/network/result.dart';
import 'package:cybersecure/features/auth/domain/models/user.dart';
import 'package:cybersecure/features/profile/domains/models/user_achievement.dart';
import 'package:cybersecure/features/profile/domains/models/user_learning_status.dart';

abstract interface class ProfileRepository {
  Future<Result<List<UserAchievement>>> getAchievements({bool forceRefresh = false});

  Future<Result<UserLearningStatus>> getLearningStatus({bool forceRefresh = false});

  Future<Result<User>> updateName({required String name});
}
