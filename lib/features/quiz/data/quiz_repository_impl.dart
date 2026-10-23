import 'package:cybersecure/core/network/result.dart';
import 'package:cybersecure/features/quiz/data/mappers/quiz_mapper.dart';
import 'package:cybersecure/features/quiz/data/quiz_remote_source.dart';
import 'package:cybersecure/features/quiz/domain/models/quiz.dart';
import 'package:cybersecure/features/quiz/domain/models/quiz_attempt.dart';
import 'package:cybersecure/features/quiz/domain/models/quiz_result.dart';
import 'package:cybersecure/features/quiz/domain/quiz_repository.dart';

class QuizRepositoryImpl implements QuizRepository {
  QuizRepositoryImpl(this._remote);

  final QuizRemoteSource _remote;

  @override
  Future<Result<List<Quiz>>> getQuizzes({bool forceRefresh = false}) async {
    final res = await _remote.getQuizzes(forceRefresh: forceRefresh);
    return res.map((dtos) => dtos.map((dto) => dto.toDomain()).toList());
  }

  @override
  Future<Result<QuizResult>> submitQuiz(QuizAttempt attempt) async {
    final res = await _remote.submitQuiz(attempt);
    return res.map((dto) => dto.toDomain());
  }
}
