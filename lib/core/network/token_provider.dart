import 'package:injectable/injectable.dart';

import '../storage/secure_storage.dart';

abstract interface class TokenProvider {
  Future<Map<String, String>> authHeaders();

  Future<bool> refresh();

  Future<void> clear();
}

@LazySingleton(as: TokenProvider)
class JwtTokenProvider implements TokenProvider {
  JwtTokenProvider(this._storage);

  final SecureStorage _storage;

  @override
  Future<Map<String, String>> authHeaders() async {
    final token = await _storage.accessToken;
    return token == null ? const {} : {'Authorization': 'Bearer $token'};
  }

  @override
  Future<bool> refresh() async {
    final refreshToken = await _storage.refreshToken;
    if (refreshToken == null) return false;

    return false;
  }

  @override
  Future<void> clear() => _storage.clearSession();
}
