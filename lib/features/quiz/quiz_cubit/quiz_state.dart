import 'package:cybersecure/core/cubit/view_state.dart';
import 'package:cybersecure/features/quiz/domain/models/quiz.dart';
import 'package:cybersecure/features/quiz/domain/models/quiz_category.dart';
import 'package:cybersecure/features/quiz/domain/models/quiz_result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_state.freezed.dart';

@freezed
abstract class QuizData with _$QuizData {
  const factory QuizData({
    QuizCategory? selectedCategory,
    @Default([]) List<Quiz> quizzes,
    @Default([]) List<Quiz> categoryQuizzes,
    Quiz? activeQuiz,
    @Default(0) int currentIndex,
    @Default({}) Map<int, int> selectedAnswers,
    QuizResult? result,
  }) = _QuizData;
}

typedef QuizState = ViewState<QuizData>;
