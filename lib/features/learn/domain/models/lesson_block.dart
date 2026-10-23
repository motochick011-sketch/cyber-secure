import 'package:cybersecure/features/learn/domain/models/callout_style.dart';
import 'package:cybersecure/features/learn/domain/models/lesson_step.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson_block.freezed.dart';

@freezed
sealed class LessonBlock with _$LessonBlock {
  const factory LessonBlock.paragraph({required String text}) = ParagraphBlock;

  const factory LessonBlock.bullets({String? heading, required List<String> items}) = BulletsBlock;

  const factory LessonBlock.steps({String? heading, required List<LessonStep> steps}) = StepsBlock;

  const factory LessonBlock.callout({String? heading, required String text, @Default(CalloutStyle.neutral) CalloutStyle style}) = CalloutBlock;

  const factory LessonBlock.compare({required String leftLabel, required String leftValue, required String rightLabel, required String rightValue}) = CompareBlock;
}
