import 'package:injectable/injectable.dart';

import 'cache_policy.dart';

abstract interface class CacheStore {
  T? get<T>(String key);

  void set<T>(String key, T value, CachePolicy policy);

  void invalidate(String key);

  void clear();
}

class _Entry {
  _Entry(this.value, this.expiresAt);

  final Object? value;
  final DateTime? expiresAt;

  bool get isExpired => expiresAt != null && DateTime.now().isAfter(expiresAt!);
}

@LazySingleton(as: CacheStore)
class InMemoryCacheStore implements CacheStore {
  final Map<String, _Entry> _store = {};

  static const Duration _defaultTtl = Duration(minutes: 5);

  @override
  T? get<T>(String key) {
    final entry = _store[key];
    if (entry == null) return null;
    if (entry.isExpired) {
      _store.remove(key);
      return null;
    }
    return entry.value as T?;
  }

  @override
  void set<T>(String key, T value, CachePolicy policy) {
    if (policy.location == CacheLocation.none) return;
    final ttl = policy.ttl ?? _defaultTtl;
    _store[key] = _Entry(value, DateTime.now().add(ttl));
  }

  @override
  void invalidate(String key) => _store.remove(key);

  @override
  void clear() => _store.clear();
}
