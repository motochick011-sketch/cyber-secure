import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SecureStorage {
  SecureStorage(this._storage);

  final FlutterSecureStorage _storage;

  Future<String?> get accessToken => _storage.read(key: _Keys.accessToken);

  Future<void> setAccessToken(String v) => _storage.write(key: _Keys.accessToken, value: v);

  Future<String?> get refreshToken => _storage.read(key: _Keys.refreshToken);

  Future<void> setRefreshToken(String v) => _storage.write(key: _Keys.refreshToken, value: v);

  Future<String?> get pinHash => _storage.read(key: _Keys.pinHash);

  Future<void> setPinHash(String hash) => _storage.write(key: _Keys.pinHash, value: hash);

  Future<void> clearPin() => _storage.delete(key: _Keys.pinHash);

  Future<void> clearSession() async {
    await _storage.delete(key: _Keys.accessToken);
    await _storage.delete(key: _Keys.refreshToken);
  }
}

abstract final class _Keys {
  static const accessToken = 'access_token';
  static const refreshToken = 'refresh_token';
  static const pinHash = 'pin_hash';
}
