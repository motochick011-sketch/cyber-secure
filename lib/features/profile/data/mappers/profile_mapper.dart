import 'package:cybersecure/features/profile/data/models/profile_dtos.dart';
import 'package:cybersecure/features/profile/domains/models/user_achievement.dart';
import 'package:cybersecure/features/profile/domains/models/user_learning_status.dart';

extension UserAchievementDtoMapper on UserAchievementDto {
  UserAchievement toDomain() => UserAchievement(id: id ?? 0, title: title ?? '', description: description ?? '', image: image ?? '');
}

extension UserLearningStatusDtoMapper on UserLearningStatusDto {
  UserLearningStatus toDomain() => UserLearningStatus(
    lessonsCompleted: lessonsCompleted ?? 0,
    totalLessons: totalLessons ?? 0,
    quizzesCompleted: quizzesCompleted ?? 0,
    quizzesPassed: quizzesPassed ?? 0,
    totalQuizzes: totalQuizzes ?? 0,
  );
}
