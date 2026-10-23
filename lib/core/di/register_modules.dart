import 'package:cybersecure/core/cache/cache_store.dart';
import 'package:cybersecure/core/config/app_config.dart';
import 'package:cybersecure/core/config/environment.dart';
import 'package:cybersecure/core/network/interceptors/auth_interceptor.dart';
import 'package:cybersecure/core/network/interceptors/logging_interceptor.dart';
import 'package:cybersecure/core/storage/secure_storage.dart';
import 'package:cybersecure/features/auth/data/auth_remote_source.dart';
import 'package:cybersecure/features/auth/data/auth_repository_impl.dart';
import 'package:cybersecure/features/auth/domain/auth_repository.dart';
import 'package:cybersecure/features/learn/data/learn_remote_source.dart';
import 'package:cybersecure/features/learn/data/learn_repository_impl.dart';
import 'package:cybersecure/features/learn/domain/learn_repository.dart';
import 'package:cybersecure/features/profile/data/profile_remote_source.dart';
import 'package:cybersecure/features/profile/data/profile_repository_impl.dart';
import 'package:cybersecure/features/profile/domains/profile_repository.dart';
import 'package:cybersecure/features/quiz/data/quiz_remote_source.dart';
import 'package:cybersecure/features/quiz/data/quiz_repository_impl.dart';
import 'package:cybersecure/features/quiz/domain/quiz_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  AppConfig appConfig() => AppConfig.forEnvironment(AppEnvironment.current());

  @preResolve
  Future<SharedPreferences> sharedPreferences() => SharedPreferences.getInstance();

  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();

  @lazySingleton
  Dio dio(AppConfig config, AuthInterceptor auth, LoggingInterceptor log) {
    final dio = Dio(BaseOptions(baseUrl: config.baseUrl, connectTimeout: config.connectTimeout, receiveTimeout: config.receiveTimeout, headers: config.defaultHeaders));
    dio.interceptors.addAll([auth, log]);
    return dio;
  }

  @lazySingleton
  AuthRepository authRepository(AppConfig config, AuthRemoteSource remote, SecureStorage secure, CacheStore cache) => AuthRepositoryImpl(remote, secure, cache);

  @lazySingleton
  ProfileRepository profileRepository(AppConfig config, ProfileRemoteSource remote) => ProfileRepositoryImpl(remote);

  @lazySingleton
  QuizRepository quizRepository(AppConfig config, QuizRemoteSource remote) => QuizRepositoryImpl(remote);

  @lazySingleton
  LearnRepository learnRepository(AppConfig config, LearnRemoteSource remote) => LearnRepositoryImpl(remote);
}
