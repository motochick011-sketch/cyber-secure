import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson_step.freezed.dart';

@freezed
abstract class LessonStep with _$LessonStep {
  const factory LessonStep({required String title, required String text}) = _LessonStep;
}
