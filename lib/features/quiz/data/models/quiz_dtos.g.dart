// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizAnswerDto _$QuizAnswerDtoFromJson(Map<String, dynamic> json) =>
    QuizAnswerDto(
      id: (json['id'] as num?)?.toInt(),
      text: json['text'] as String?,
    );

QuizQuestionDto _$QuizQuestionDtoFromJson(Map<String, dynamic> json) =>
    QuizQuestionDto(
      id: (json['id'] as num?)?.toInt(),
      text: json['text'] as String?,
      answers: (json['answers'] as List<dynamic>?)
          ?.map((e) => QuizAnswerDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      correctAnswerId: (json['correctAnswerId'] as num?)?.toInt(),
    );

QuizDto _$QuizDtoFromJson(Map<String, dynamic> json) => QuizDto(
  id: (json['id'] as num?)?.toInt(),
  category: json['category'] as String?,
  title: json['title'] as String?,
  subtitle: json['subtitle'] as String?,
  questions: (json['questions'] as List<dynamic>?)
      ?.map((e) => QuizQuestionDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

QuizResultDto _$QuizResultDtoFromJson(Map<String, dynamic> json) =>
    QuizResultDto(
      quizId: (json['quizId'] as num?)?.toInt(),
      score: (json['score'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
      passed: json['passed'] as bool?,
    );
