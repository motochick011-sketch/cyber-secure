import '../../../core/cache/cache_store.dart';
import '../../../core/network/result.dart';
import '../../../core/storage/secure_storage.dart';
import '../domain/auth_repository.dart';
import '../domain/models/auth_tokens.dart';
import '../domain/models/user.dart';
import 'auth_remote_source.dart';
import 'mappers/auth_mapper.dart';
import 'models/auth_request_dto.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._remote, this._secure, this._cache);

  final AuthRemoteSource _remote;
  final SecureStorage _secure;
  final CacheStore _cache;

  static const _userCacheKey = 'auth:me';

  Future<Result<AuthTokens>> _storeTokens(Result<AuthTokens> result) async {
    if (result case Success(:final value)) {
      await _secure.setAccessToken(value.accessToken);
      await _secure.setRefreshToken(value.refreshToken);
    }
    return result;
  }

  @override
  Future<Result<AuthTokens>> login({required String email, required String password}) async {
    final res = await _remote.login(LoginRequestDto(email: email, password: password));
    return _storeTokens(res.map((dto) => dto.toDomain()));
  }

  @override
  Future<Result<AuthTokens>> register({required String email, required String password}) async {
    final res = await _remote.register(RegisterRequestDto(userEmail: email, password: password));
    return _storeTokens(res.map((dto) => dto.toDomain()));
  }

  @override
  Future<Result<void>> forgotPassword({required String email}) => _remote.forgotPassword(ForgotPasswordRequestDto(email: email));

  @override
  Future<Result<User>> getCurrentUser({bool forceRefresh = false}) async {
    final res = await _remote.getCurrentUser(forceRefresh: forceRefresh);
    return res.map((dto) => dto.toDomain());
  }

  @override
  Future<void> logout() async {
    await _secure.clearSession();
    _cache.invalidate(_userCacheKey);
  }

  @override
  Future<void> refreshCachedUser(User user) async {
    _cache.invalidate(_userCacheKey);
  }
}
