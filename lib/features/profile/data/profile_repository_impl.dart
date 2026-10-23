import 'package:cybersecure/core/network/result.dart';
import 'package:cybersecure/features/auth/data/mappers/auth_mapper.dart';
import 'package:cybersecure/features/auth/domain/models/user.dart';
import 'package:cybersecure/features/profile/data/mappers/profile_mapper.dart';
import 'package:cybersecure/features/profile/data/profile_remote_source.dart';
import 'package:cybersecure/features/profile/domains/models/user_achievement.dart';
import 'package:cybersecure/features/profile/domains/models/user_learning_status.dart';
import 'package:cybersecure/features/profile/domains/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(this._remote);

  final ProfileRemoteSource _remote;

  @override
  Future<Result<List<UserAchievement>>> getAchievements({bool forceRefresh = false}) async {
    final res = await _remote.getAchievements(forceRefresh: forceRefresh);
    return res.map((dtos) => dtos.map((dto) => dto.toDomain()).toList());
  }

  @override
  Future<Result<UserLearningStatus>> getLearningStatus({bool forceRefresh = false}) async {
    final res = await _remote.getLearningStatus(forceRefresh: forceRefresh);
    return res.map((dto) => dto.toDomain());
  }

  @override
  Future<Result<User>> updateName({required String name}) async {
    final res = await _remote.updateName(name: name);

    return res.map((dto) => dto.toDomain());
  }
}
