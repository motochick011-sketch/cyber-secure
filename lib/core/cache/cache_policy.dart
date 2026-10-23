enum CacheLocation { memory, persisted, none }

class CachePolicy {
  const CachePolicy(this.location, {this.ttl});

  final CacheLocation location;
  final Duration? ttl;

  static const CachePolicy memoryDefault = CachePolicy(CacheLocation.memory);

  static CachePolicy memory({Duration? ttl}) => CachePolicy(CacheLocation.memory, ttl: ttl);

  static CachePolicy persisted({Duration? ttl}) => CachePolicy(CacheLocation.persisted, ttl: ttl);
  static const CachePolicy none = CachePolicy(CacheLocation.none);
}
