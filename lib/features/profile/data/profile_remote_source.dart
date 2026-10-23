import 'package:cybersecure/core/cache/cache_policy.dart';
import 'package:cybersecure/core/network/api_client.dart';
import 'package:cybersecure/core/network/api_routes.dart';
import 'package:cybersecure/core/network/result.dart';
import 'package:cybersecure/features/auth/data/models/auth_response_dto.dart';
import 'package:cybersecure/features/profile/data/models/profile_dtos.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ProfileRemoteSource {
  ProfileRemoteSource(this._api);

  final ApiClient _api;

  Future<Result<List<UserAchievementDto>>> getAchievements({bool forceRefresh = false}) => _api.get(
    ApiRoutes.getAchievements,
    cacheKey: 'profile:achievements',
    cache: CachePolicy.memory(ttl: const Duration(minutes: 5)),
    forceRefresh: forceRefresh,
    parse: (json) => (json as List).map((e) => UserAchievementDto.fromJson(e as Map<String, dynamic>)).toList(),
  );

  Future<Result<UserLearningStatusDto>> getLearningStatus({bool forceRefresh = false}) => _api.get(
    ApiRoutes.getLearningStatus,
    cacheKey: 'profile:learning-status',
    cache: CachePolicy.memory(ttl: const Duration(minutes: 5)),
    forceRefresh: forceRefresh,
    parse: (json) => UserLearningStatusDto.fromJson(json as Map<String, dynamic>),
  );

  Future<Result<UserDto>> updateName({required String name}) => _api.put(ApiRoutes.updateProfile, body: {'name': name}, parse: (json) => UserDto.fromJson(json as Map<String, dynamic>));
}
