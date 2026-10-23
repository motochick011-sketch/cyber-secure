import 'package:cybersecure/features/quiz/domain/models/quiz_category.dart';
import 'package:cybersecure/features/quiz/domain/models/quiz_question.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz.freezed.dart';

@freezed
abstract class Quiz with _$Quiz {
  const factory Quiz({required int id, required QuizCategory category, required String title, String? subtitle, required List<QuizQuestion> questions}) = _Quiz;
}
