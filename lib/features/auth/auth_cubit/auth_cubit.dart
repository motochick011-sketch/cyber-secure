import 'package:injectable/injectable.dart';

import '../../../core/cubit/base_cubit.dart';
import '../../../core/network/result.dart';
import '../../../core/session/session_cubit/session_cubit.dart';
import '../domain/auth_repository.dart';
import 'auth_state.dart';

@lazySingleton
class AuthCubit extends BaseCubit<AuthData> {
  AuthCubit(this._repo, this._session) : super(const AuthData());

  final AuthRepository _repo;
  final SessionCubit _session;

  Future<void> login({required String email, required String password}) async {
    setLoading();
    switch (await _repo.login(email: email, password: password)) {
      case Success():
        await _session.hydrate(force: true);
        setLoaded(state.data);
      case Failure(:final error):
        setFailure(error);
    }
  }

  Future<void> register({required String email, required String password}) async {
    setLoading();
    switch (await _repo.register(email: email, password: password)) {
      case Success():
        await _session.hydrate(force: true);
        setLoaded(state.data);
      case Failure(:final error):
        setFailure(error);
    }
  }

  Future<void> forgotPassword({required String email}) async {
    setLoading();
    switch (await _repo.forgotPassword(email: email)) {
      case Success():
        setLoaded(state.data.copyWith(resetEmailSent: true));
      case Failure(:final error):
        setFailure(error);
    }
  }

  void reset() => setLoaded(const AuthData());
}
