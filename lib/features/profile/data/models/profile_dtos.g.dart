// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAchievementDto _$UserAchievementDtoFromJson(Map<String, dynamic> json) =>
    UserAchievementDto(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
    );

UserLearningStatusDto _$UserLearningStatusDtoFromJson(
  Map<String, dynamic> json,
) => UserLearningStatusDto(
  lessonsCompleted: (json['lessonsCompleted'] as num?)?.toInt(),
  totalLessons: (json['totalLessons'] as num?)?.toInt(),
  quizzesCompleted: (json['quizzesCompleted'] as num?)?.toInt(),
  quizzesPassed: (json['quizzesPassed'] as num?)?.toInt(),
  totalQuizzes: (json['totalQuizzes'] as num?)?.toInt(),
);
