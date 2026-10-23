import 'package:injectable/injectable.dart';

import '../../../core/cache/cache_policy.dart';
import '../../../core/network/api_client.dart';
import '../../../core/network/api_routes.dart';
import '../../../core/network/result.dart';
import 'models/auth_request_dto.dart';
import 'models/auth_response_dto.dart';

@lazySingleton
class AuthRemoteSource {
  AuthRemoteSource(this._api);

  final ApiClient _api;

  Future<Result<TokenResponseDto>> login(LoginRequestDto body) => _api.post(ApiRoutes.login, body: body.toJson(), parse: (json) => TokenResponseDto.fromJson(json as Map<String, dynamic>));

  Future<Result<TokenResponseDto>> register(RegisterRequestDto body) => _api.post(ApiRoutes.register, body: body.toJson(), parse: (json) => TokenResponseDto.fromJson(json as Map<String, dynamic>));

  Future<Result<void>> forgotPassword(ForgotPasswordRequestDto body) => _api.post<void>(ApiRoutes.forgotPassword, body: body.toJson(), parse: (_) {});

  Future<Result<UserDto>> getCurrentUser({bool forceRefresh = false}) => _api.get(
    ApiRoutes.me,
    cacheKey: 'auth:me',
    cache: CachePolicy.persisted(ttl: const Duration(minutes: 30)),
    forceRefresh: forceRefresh,
    parse: (json) => UserDto.fromJson(json as Map<String, dynamic>),
  );
}
