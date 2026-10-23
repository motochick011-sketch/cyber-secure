import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../app/app_cubit/app_cubit.dart';
import '../../../features/auth/domain/auth_repository.dart';
import '../../../features/auth/domain/models/user.dart';
import '../../cubit/base_cubit.dart';
import '../../di/injector.dart';
import '../../di/locators.dart';
import '../../network/result.dart';
import '../../storage/secure_storage.dart';
import 'session_state.dart';

@lazySingleton
class SessionCubit extends BaseCubit<SessionData> {
  SessionCubit(this._auth, this._secure, this._appCubit) : super(const SessionData());

  final AuthRepository _auth;
  final SecureStorage _secure;
  final AppCubit _appCubit;

  User? get currentUser => state.data.user;

  Future<bool> hydrate({bool force = false}) async {
    setLoading();

    final token = await _secure.accessToken;
    if (token == null) {
      setLoaded(const SessionData());
      _appCubit.onUnauthenticated();
      return false;
    }

    switch (await _auth.getCurrentUser(forceRefresh: force)) {
      case Success(:final value):
        setLoaded(SessionData(user: value));
        _appCubit.onAuthenticated();

        unawaited(getIt.profile.load());
        return true;
      case Failure(:final error):
        setFailure(error);
        await _auth.logout();
        _appCubit.onUnauthenticated();
        return false;
    }
  }

  Future<void> updateUser(User user) async {
    setLoaded(state.data.copyWith(user: user));
    await _auth.refreshCachedUser(user);
  }

  Future<void> clear() async {
    await _auth.logout();
    setLoaded(const SessionData());
    _appCubit.onUnauthenticated();
  }
}
