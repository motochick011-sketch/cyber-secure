import 'package:cybersecure/core/cache/cache_policy.dart';
import 'package:cybersecure/core/network/api_client.dart';
import 'package:cybersecure/core/network/api_routes.dart';
import 'package:cybersecure/core/network/result.dart';
import 'package:cybersecure/features/quiz/data/models/quiz_dtos.dart';
import 'package:cybersecure/features/quiz/domain/models/quiz_attempt.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class QuizRemoteSource {
  QuizRemoteSource(this._api);

  final ApiClient _api;

  Future<Result<List<QuizDto>>> getQuizzes({bool forceRefresh = false}) => _api.get(
    ApiRoutes.getQuizzes,
    cacheKey: 'quiz:all',
    cache: CachePolicy.memory(ttl: const Duration(minutes: 5)),
    forceRefresh: forceRefresh,
    parse: (json) => (json as List).map((e) => QuizDto.fromJson(e as Map<String, dynamic>)).toList(),
  );

  Future<Result<QuizResultDto>> submitQuiz(QuizAttempt attempt) => _api.post(
    ApiRoutes.submitQuiz,
    body: {
      'quizId': attempt.quizId,
      'answers': attempt.answers.entries.map((e) => {'questionId': e.key, 'answerId': e.value}).toList(),
    },
    parse: (json) => QuizResultDto.fromJson(json as Map<String, dynamic>),
  );
}
