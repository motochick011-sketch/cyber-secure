import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_attempt.freezed.dart';

@freezed
abstract class QuizAttempt with _$QuizAttempt {
  const factory QuizAttempt({required int quizId, required Map<int, int> answers}) = _QuizAttempt;
}
