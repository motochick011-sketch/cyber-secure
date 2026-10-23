import 'package:cybersecure/core/cubit/base_cubit.dart';
import 'package:cybersecure/core/network/result.dart';
import 'package:cybersecure/features/quiz/domain/models/quiz.dart';
import 'package:cybersecure/features/quiz/domain/models/quiz_attempt.dart';
import 'package:cybersecure/features/quiz/domain/models/quiz_category.dart';
import 'package:cybersecure/features/quiz/domain/models/quiz_question.dart';
import 'package:cybersecure/features/quiz/domain/models/quiz_result.dart';
import 'package:cybersecure/features/quiz/domain/quiz_repository.dart';
import 'package:injectable/injectable.dart';

import 'quiz_state.dart';

@lazySingleton
class QuizCubit extends BaseCubit<QuizData> {
  QuizCubit(this._repo) : super(const QuizData());

  final QuizRepository _repo;

  Quiz? get activeQuiz => state.data.activeQuiz;

  QuizQuestion? get currentQuestion {
    final quiz = activeQuiz;
    if (quiz == null || quiz.questions.isEmpty) return null;
    final index = state.data.currentIndex;
    if (index < 0 || index >= quiz.questions.length) return null;
    return quiz.questions[index];
  }

  bool get isLastQuestion {
    final quiz = activeQuiz;
    if (quiz == null) return false;
    return state.data.currentIndex >= quiz.questions.length - 1;
  }

  bool get hasAnsweredCurrent {
    final question = currentQuestion;
    if (question == null) return false;
    return state.data.selectedAnswers.containsKey(question.id);
  }

  int? selectedAnswerFor(int questionId) => state.data.selectedAnswers[questionId];

  bool wasCorrect(int questionId) {
    final quiz = activeQuiz;
    if (quiz == null) return false;
    final question = quiz.questions.where((q) => q.id == questionId).toList();
    if (question.isEmpty) return false;
    return state.data.selectedAnswers[questionId] == question.first.correctAnswerId;
  }

  Future<void> load({bool forceRefresh = false}) async {
    setLoading();
    switch (await _repo.getQuizzes(forceRefresh: forceRefresh)) {
      case Success(:final value):
        setLoaded(state.data.copyWith(quizzes: value));
      case Failure(:final error):
        setFailure(error);
    }
  }

  void selectCategory(QuizCategory category) {
    final filtered = List.of(state.data.quizzes.where((q) => q.category == category))..shuffle();
    final shuffled = filtered.map((quiz) => quiz.copyWith(questions: List.of(quiz.questions)..shuffle())).toList();
    setLoaded(state.data.copyWith(selectedCategory: category, categoryQuizzes: shuffled, activeQuiz: null, currentIndex: 0, selectedAnswers: {}, result: null));
  }

  void selectQuiz(int quizId) {
    final match = state.data.categoryQuizzes.where((q) => q.id == quizId).toList();
    if (match.isEmpty) return;
    setLoaded(state.data.copyWith(activeQuiz: match.first, currentIndex: 0, selectedAnswers: {}, result: null));
  }

  void selectAnswer(int questionId, int answerId) {
    final updated = Map<int, int>.of(state.data.selectedAnswers)..[questionId] = answerId;
    setLoaded(state.data.copyWith(selectedAnswers: updated));
  }

  void next() {
    final quiz = activeQuiz;
    if (quiz == null) return;
    final nextIndex = state.data.currentIndex + 1;
    if (nextIndex >= quiz.questions.length) return;
    setLoaded(state.data.copyWith(currentIndex: nextIndex));
  }

  Future<void> submit() async {
    final quiz = activeQuiz;
    if (quiz == null) return;

    final answers = state.data.selectedAnswers;
    final attempt = QuizAttempt(quizId: quiz.id, answers: answers);

    var score = 0;
    for (final question in quiz.questions) {
      if (answers[question.id] == question.correctAnswerId) score++;
    }
    final total = quiz.questions.length;
    final passed = total == 0 ? false : score / total >= 0.6;
    final localResult = QuizResult(quizId: quiz.id, score: score, total: total, passed: passed);

    switch (await _repo.submitQuiz(attempt)) {
      case Failure(:final error):
        setFailure(error);
        return;
      case Success():
        setLoaded(state.data.copyWith(result: localResult));
    }
  }
}
