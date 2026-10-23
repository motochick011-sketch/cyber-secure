import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_answer.freezed.dart';

@freezed
abstract class QuizAnswer with _$QuizAnswer {
  const factory QuizAnswer({required int id, required String text}) = _QuizAnswer;
}
