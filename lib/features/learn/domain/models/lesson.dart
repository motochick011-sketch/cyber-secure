import 'package:cybersecure/core/domain/category.dart';
import 'package:cybersecure/features/learn/domain/models/lesson_block.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson.freezed.dart';

@freezed
abstract class Lesson with _$Lesson {
  const factory Lesson({required int id, required QuizCategory category, required String title, String? subtitle, required int order, required List<LessonBlock> blocks}) = _Lesson;
}
