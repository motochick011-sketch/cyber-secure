import 'package:cybersecure/core/network/result.dart';
import 'package:cybersecure/features/quiz/domain/models/quiz.dart';
import 'package:cybersecure/features/quiz/domain/models/quiz_attempt.dart';
import 'package:cybersecure/features/quiz/domain/models/quiz_result.dart';

abstract interface class QuizRepository {
  Future<Result<List<Quiz>>> getQuizzes({bool forceRefresh = false});

  Future<Result<QuizResult>> submitQuiz(QuizAttempt attempt);
}
