import 'package:cybersecure/core/domain/category.dart';
import 'package:cybersecure/features/learn/data/models/learn_dtos.dart';
import 'package:cybersecure/features/learn/domain/models/callout_style.dart';
import 'package:cybersecure/features/learn/domain/models/lesson.dart';
import 'package:cybersecure/features/learn/domain/models/lesson_block.dart';
import 'package:cybersecure/features/learn/domain/models/lesson_step.dart';

extension LessonStepDtoMapper on LessonStepDto {
  LessonStep toDomain() => LessonStep(title: title ?? '', text: text ?? '');
}

extension LessonBlockDtoMapper on LessonBlockDto {
  LessonBlock toDomain() {
    switch (type) {
      case 'paragraph':
        return LessonBlock.paragraph(text: text ?? '');
      case 'bullets':
        return LessonBlock.bullets(heading: heading, items: items ?? const []);
      case 'steps':
        return LessonBlock.steps(heading: heading, steps: (steps ?? const []).map((s) => s.toDomain()).toList());
      case 'callout':
        return LessonBlock.callout(heading: heading, text: text ?? '', style: _calloutStyleFromString(style));
      case 'compare':
        return LessonBlock.compare(leftLabel: leftLabel ?? '', leftValue: leftValue ?? '', rightLabel: rightLabel ?? '', rightValue: rightValue ?? '');
      default:
        return LessonBlock.paragraph(text: text ?? '');
    }
  }
}

extension LessonDtoMapper on LessonDto {
  Lesson toDomain() => Lesson(
    id: id ?? 0,

    category: QuizCategory.fromString(category) ?? QuizCategory.phishing,
    title: title ?? '',
    subtitle: subtitle,
    order: order ?? 0,
    blocks: (blocks ?? const []).map((b) => b.toDomain()).toList(),
  );
}

CalloutStyle _calloutStyleFromString(String? value) {
  switch (value) {
    case 'secondary':
      return CalloutStyle.secondary;
    case 'success':
      return CalloutStyle.success;
    case 'warning':
      return CalloutStyle.warning;
    default:
      return CalloutStyle.neutral;
  }
}
