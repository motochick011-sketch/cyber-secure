import 'package:json_annotation/json_annotation.dart';

part 'profile_dtos.g.dart';

@JsonSerializable(createToJson: false)
class UserAchievementDto {
  UserAchievementDto({this.id, this.title, this.description, this.image});

  final int? id;
  final String? title;
  final String? description;
  final String? image;

  factory UserAchievementDto.fromJson(Map<String, dynamic> json) => _$UserAchievementDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class UserLearningStatusDto {
  UserLearningStatusDto({this.lessonsCompleted, this.totalLessons, this.quizzesCompleted, this.quizzesPassed, this.totalQuizzes});

  final int? lessonsCompleted;
  final int? totalLessons;
  final int? quizzesCompleted;
  final int? quizzesPassed;
  final int? totalQuizzes;

  factory UserLearningStatusDto.fromJson(Map<String, dynamic> json) => _$UserLearningStatusDtoFromJson(json);
}
