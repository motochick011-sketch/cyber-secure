import 'package:json_annotation/json_annotation.dart';

part 'quiz_dtos.g.dart';

@JsonSerializable(createToJson: false)
class QuizAnswerDto {
  QuizAnswerDto({this.id, this.text});

  final int? id;
  final String? text;

  factory QuizAnswerDto.fromJson(Map<String, dynamic> json) => _$QuizAnswerDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class QuizQuestionDto {
  QuizQuestionDto({this.id, this.text, this.answers, this.correctAnswerId});

  final int? id;
  final String? text;
  final List<QuizAnswerDto>? answers;
  final int? correctAnswerId;

  factory QuizQuestionDto.fromJson(Map<String, dynamic> json) => _$QuizQuestionDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class QuizDto {
  QuizDto({this.id, this.category, this.title, this.subtitle, this.questions});

  final int? id;
  final String? category;
  final String? title;
  final String? subtitle;
  final List<QuizQuestionDto>? questions;

  factory QuizDto.fromJson(Map<String, dynamic> json) => _$QuizDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class QuizResultDto {
  QuizResultDto({this.quizId, this.score, this.total, this.passed});

  final int? quizId;
  final int? score;
  final int? total;
  final bool? passed;

  factory QuizResultDto.fromJson(Map<String, dynamic> json) => _$QuizResultDtoFromJson(json);
}
