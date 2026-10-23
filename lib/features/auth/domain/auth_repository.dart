import '../../../core/network/result.dart';
import 'models/auth_tokens.dart';
import 'models/user.dart';

abstract interface class AuthRepository {
  Future<Result<AuthTokens>> login({required String email, required String password});

  Future<Result<AuthTokens>> register({required String email, required String password});

  Future<Result<void>> forgotPassword({required String email});

  Future<Result<User>> getCurrentUser({bool forceRefresh = false});

  Future<void> logout();

  Future<void> refreshCachedUser(User user);
}
