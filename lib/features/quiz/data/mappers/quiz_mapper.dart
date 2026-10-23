import 'package:cybersecure/features/quiz/data/models/quiz_dtos.dart';
import 'package:cybersecure/features/quiz/domain/models/quiz.dart';
import 'package:cybersecure/features/quiz/domain/models/quiz_answer.dart';
import 'package:cybersecure/features/quiz/domain/models/quiz_category.dart';
import 'package:cybersecure/features/quiz/domain/models/quiz_question.dart';
import 'package:cybersecure/features/quiz/domain/models/quiz_result.dart';

extension QuizAnswerDtoMapper on QuizAnswerDto {
  QuizAnswer toDomain() => QuizAnswer(id: id ?? 0, text: text ?? '');
}

extension QuizQuestionDtoMapper on QuizQuestionDto {
  QuizQuestion toDomain() => QuizQuestion(id: id ?? 0, text: text ?? '', answers: (answers ?? const []).map((a) => a.toDomain()).toList(), correctAnswerId: correctAnswerId ?? 0);
}

extension QuizDtoMapper on QuizDto {
  Quiz toDomain() => Quiz(
    id: id ?? 0,

    category: QuizCategory.fromString(category) ?? QuizCategory.phishing,
    title: title ?? '',
    subtitle: subtitle,
    questions: (questions ?? const []).map((q) => q.toDomain()).toList(),
  );
}

extension QuizResultDtoMapper on QuizResultDto {
  QuizResult toDomain() => QuizResult(quizId: quizId ?? 0, score: score ?? 0, total: total ?? 0, passed: passed ?? false);
}
