import '../../domain/models/auth_tokens.dart';
import '../../domain/models/user.dart';
import '../models/auth_response_dto.dart';

extension TokenResponseMapper on TokenResponseDto {
  AuthTokens toDomain() => AuthTokens(accessToken: accessToken ?? '', refreshToken: refreshToken ?? '');
}

extension UserDtoMapper on UserDto {
  User toDomain() => User(
    id: id ?? '',
    email: email ?? '',
    name: name ?? '',
    avatarUrl: avatarUrl,

    lastName: lastName,
    phone: phone,
    createdAt: createdAt == null ? null : DateTime.tryParse(createdAt!),

    level: UserLevel.fromString(level),
  );
}
