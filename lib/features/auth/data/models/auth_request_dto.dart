import 'package:json_annotation/json_annotation.dart';

part 'auth_request_dto.g.dart';

@JsonSerializable(createFactory: false)
class LoginRequestDto {
  LoginRequestDto({required this.email, required this.password});

  final String email;
  final String password;

  Map<String, dynamic> toJson() => _$LoginRequestDtoToJson(this);
}

@JsonSerializable(createFactory: false)
class RegisterRequestDto {
  RegisterRequestDto({required this.userEmail, required this.password});

  @JsonKey(name: 'email')
  final String userEmail;

  final String password;

  Map<String, dynamic> toJson() => _$RegisterRequestDtoToJson(this);
}

@JsonSerializable(createFactory: false)
class ForgotPasswordRequestDto {
  ForgotPasswordRequestDto({required this.email});

  final String email;

  Map<String, dynamic> toJson() => _$ForgotPasswordRequestDtoToJson(this);
}
