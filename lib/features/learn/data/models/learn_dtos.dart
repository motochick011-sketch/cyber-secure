import 'package:json_annotation/json_annotation.dart';

part 'learn_dtos.g.dart';

@JsonSerializable(createToJson: false)
class LessonStepDto {
  LessonStepDto({this.id, this.title, this.text});

  final int? id;
  final String? title;
  final String? text;

  factory LessonStepDto.fromJson(Map<String, dynamic> json) => _$LessonStepDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class LessonBlockDto {
  LessonBlockDto({this.type, this.text, this.heading, this.items, this.steps, this.style, this.leftLabel, this.leftValue, this.rightLabel, this.rightValue});

  final String? type;
  final String? text;
  final String? heading;
  final List<String>? items;
  final List<LessonStepDto>? steps;
  final String? style;
  final String? leftLabel;
  final String? leftValue;
  final String? rightLabel;
  final String? rightValue;

  factory LessonBlockDto.fromJson(Map<String, dynamic> json) => _$LessonBlockDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class LessonDto {
  LessonDto({this.id, this.category, this.title, this.subtitle, this.order, this.blocks});

  final int? id;
  final String? category;
  final String? title;
  final String? subtitle;
  final int? order;
  final List<LessonBlockDto>? blocks;

  factory LessonDto.fromJson(Map<String, dynamic> json) => _$LessonDtoFromJson(json);
}
