// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learn_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonStepDto _$LessonStepDtoFromJson(Map<String, dynamic> json) =>
    LessonStepDto(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      text: json['text'] as String?,
    );

LessonBlockDto _$LessonBlockDtoFromJson(Map<String, dynamic> json) =>
    LessonBlockDto(
      type: json['type'] as String?,
      text: json['text'] as String?,
      heading: json['heading'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      steps: (json['steps'] as List<dynamic>?)
          ?.map((e) => LessonStepDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      style: json['style'] as String?,
      leftLabel: json['leftLabel'] as String?,
      leftValue: json['leftValue'] as String?,
      rightLabel: json['rightLabel'] as String?,
      rightValue: json['rightValue'] as String?,
    );

LessonDto _$LessonDtoFromJson(Map<String, dynamic> json) => LessonDto(
  id: (json['id'] as num?)?.toInt(),
  category: json['category'] as String?,
  title: json['title'] as String?,
  subtitle: json['subtitle'] as String?,
  order: (json['order'] as num?)?.toInt(),
  blocks: (json['blocks'] as List<dynamic>?)
      ?.map((e) => LessonBlockDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);
