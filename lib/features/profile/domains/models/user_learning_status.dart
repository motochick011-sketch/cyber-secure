import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_learning_status.freezed.dart';

@freezed
abstract class UserLearningStatus with _$UserLearningStatus {
  const factory UserLearningStatus({required int lessonsCompleted, required int totalLessons, required int quizzesCompleted, required int quizzesPassed, required int totalQuizzes}) =
      _UserLearningStatus;
}
