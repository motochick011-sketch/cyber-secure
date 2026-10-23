import 'package:json_annotation/json_annotation.dart';

part 'auth_response_dto.g.dart';

@JsonSerializable(createToJson: false)
class TokenResponseDto {
  TokenResponseDto({this.accessToken, this.refreshToken});

  final String? accessToken;
  final String? refreshToken;

  factory TokenResponseDto.fromJson(Map<String, dynamic> json) => _$TokenResponseDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class UserDto {
  UserDto({this.id, this.email, this.name, this.avatarUrl, this.lastName, this.phone, this.createdAt, this.level});

  final String? id;
  final String? email;
  final String? name;
  final String? avatarUrl;

  @JsonKey(name: 'surname')
  final String? lastName;

  final String? phone;
  final String? createdAt;

  final String? level;

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);
}
