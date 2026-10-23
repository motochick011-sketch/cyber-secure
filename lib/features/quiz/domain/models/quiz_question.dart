import 'package:cybersecure/features/quiz/domain/models/quiz_answer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_question.freezed.dart';

@freezed
abstract class QuizQuestion with _$QuizQuestion {
  const factory QuizQuestion({required int id, required String text, required List<QuizAnswer> answers, required int correctAnswerId}) = _QuizQuestion;
}
