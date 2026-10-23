import 'package:cybersecure/core/cubit/base_cubit.dart';
import 'package:cybersecure/core/network/result.dart';
import 'package:cybersecure/core/session/session_cubit/session_cubit.dart';
import 'package:cybersecure/features/profile/domains/models/user_achievement.dart';
import 'package:cybersecure/features/profile/domains/models/user_learning_status.dart';
import 'package:cybersecure/features/profile/domains/profile_repository.dart';
import 'package:injectable/injectable.dart';

import 'profile_state.dart';

@lazySingleton
class ProfileCubit extends BaseCubit<ProfileData> {
  ProfileCubit(this._repo, this._session) : super(const ProfileData());

  final ProfileRepository _repo;
  final SessionCubit _session;

  List<UserAchievement> get achievements => state.data.achievements;

  UserLearningStatus? get learningStatus => state.data.learningStatus;

  Future<void> load({bool forceRefresh = false}) async {
    setLoading();

    Result<List<UserAchievement>> achievementsRes = await _repo.getAchievements(forceRefresh: forceRefresh);
    final statusRes = await _repo.getLearningStatus(forceRefresh: forceRefresh);
    if (achievementsRes case Failure(:final error)) return setFailure(error);
    if (statusRes case Failure(:final error)) return setFailure(error);

    setLoaded(state.data.copyWith(achievements: achievementsRes.valueOrNull ?? const [], learningStatus: statusRes.valueOrNull));
  }

  Future<void> updateName(String name) async {
    setLoading();
    switch (await _repo.updateName(name: name)) {
      case Failure(:final error):
        setFailure(error);
      case Success(:final value):
        await _session.updateUser(value);
        setLoaded(state.data);
    }
  }

  Future<void> loadAchievements({bool forceRefresh = false}) async {
    setLoading();
    switch (await _repo.getAchievements(forceRefresh: forceRefresh)) {
      case Success(:final value):
        setLoaded(state.data.copyWith(achievements: value));
      case Failure(:final error):
        setFailure(error);
    }
  }
}
