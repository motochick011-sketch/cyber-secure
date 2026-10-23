// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$LoginRequestDtoToJson(LoginRequestDto instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};

Map<String, dynamic> _$RegisterRequestDtoToJson(RegisterRequestDto instance) =>
    <String, dynamic>{
      'email': instance.userEmail,
      'password': instance.password,
    };

Map<String, dynamic> _$ForgotPasswordRequestDtoToJson(
  ForgotPasswordRequestDto instance,
) => <String, dynamic>{'email': instance.email};
