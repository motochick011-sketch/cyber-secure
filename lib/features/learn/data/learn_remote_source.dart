import 'package:cybersecure/core/cache/cache_policy.dart';
import 'package:cybersecure/core/network/api_client.dart';
import 'package:cybersecure/core/network/api_routes.dart';
import 'package:cybersecure/core/network/result.dart';
import 'package:cybersecure/features/learn/data/models/learn_dtos.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LearnRemoteSource {
  LearnRemoteSource(this._api);

  final ApiClient _api;

  Future<Result<List<LessonDto>>> getLessons({bool forceRefresh = false}) => _api.get(
    ApiRoutes.getLessons,
    cacheKey: 'learn:all',
    cache: CachePolicy.memory(ttl: const Duration(minutes: 5)),
    forceRefresh: forceRefresh,
    parse: (json) => (json as List).map((e) => LessonDto.fromJson(e as Map<String, dynamic>)).toList(),
  );
}
