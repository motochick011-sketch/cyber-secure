import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_result.freezed.dart';

@freezed
abstract class QuizResult with _$QuizResult {
  const factory QuizResult({required int quizId, required int score, required int total, required bool passed}) = _QuizResult;
}
