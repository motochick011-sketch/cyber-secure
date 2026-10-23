import 'package:cybersecure/core/cubit/view_state.dart';
import 'package:cybersecure/core/domain/category.dart';
import 'package:cybersecure/features/learn/domain/models/lesson.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'learn_state.freezed.dart';

@freezed
abstract class LearnData with _$LearnData {
  const factory LearnData({@Default([]) List<Lesson> lessons, @Default([]) List<Lesson> categoryLessons, QuizCategory? selectedCategory, Lesson? activeLesson, @Default(0) int currentIndex}) =
      _LearnData;
}

typedef LearnState = ViewState<LearnData>;
