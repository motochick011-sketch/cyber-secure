import 'package:cybersecure/core/cubit/base_cubit.dart';
import 'package:cybersecure/core/domain/category.dart';
import 'package:cybersecure/core/network/result.dart';
import 'package:cybersecure/features/learn/domain/learn_repository.dart';
import 'package:injectable/injectable.dart';

import 'learn_state.dart';

@lazySingleton
class LearnCubit extends BaseCubit<LearnData> {
  LearnCubit(this._repo) : super(const LearnData());

  final LearnRepository _repo;

  int get lessonNumber => state.data.currentIndex + 1;

  int get totalInCategory => state.data.categoryLessons.length;

  bool get isLastLesson => state.data.currentIndex >= state.data.categoryLessons.length - 1;

  double get progress => totalInCategory == 0 ? 0 : lessonNumber / totalInCategory;

  Future<void> load({bool forceRefresh = false}) async {
    setLoading();
    switch (await _repo.getLessons(forceRefresh: forceRefresh)) {
      case Success(:final value):
        setLoaded(state.data.copyWith(lessons: value));
      case Failure(:final error):
        setFailure(error);
    }
  }

  void startCategory(QuizCategory category) {
    final filtered = state.data.lessons.where((l) => l.category == category).toList()..sort((a, b) => a.order.compareTo(b.order));
    setLoaded(state.data.copyWith(selectedCategory: category, categoryLessons: filtered, activeLesson: filtered.isEmpty ? null : filtered.first, currentIndex: 0));
  }

  void selectLesson(int id) {
    final index = state.data.categoryLessons.indexWhere((l) => l.id == id);
    if (index < 0) return;
    setLoaded(state.data.copyWith(activeLesson: state.data.categoryLessons[index], currentIndex: index));
  }

  void next() {
    int nextIndex = state.data.currentIndex + 1;
    if (nextIndex >= state.data.categoryLessons.length) return;
    setLoaded(state.data.copyWith(currentIndex: nextIndex, activeLesson: state.data.categoryLessons[nextIndex]));
  }

  void previous() {
    int previousIndex = state.data.currentIndex - 1;
    if (previousIndex <= -1) return;
    setLoaded(state.data.copyWith(currentIndex: previousIndex, activeLesson: state.data.categoryLessons[previousIndex]));
  }
}
