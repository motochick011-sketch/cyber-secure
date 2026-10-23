// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../app/app_cubit/app_cubit.dart' as _i942;
import '../../features/auth/auth_cubit/auth_cubit.dart' as _i199;
import '../../features/auth/data/auth_remote_source.dart' as _i275;
import '../../features/auth/domain/auth_repository.dart' as _i996;
import '../../features/learn/data/learn_remote_source.dart' as _i642;
import '../../features/learn/domain/learn_repository.dart' as _i892;
import '../../features/learn/learn_cubit/learn_cubit.dart' as _i637;
import '../../features/profile/data/profile_remote_source.dart' as _i878;
import '../../features/profile/domains/profile_repository.dart' as _i147;
import '../../features/profile/profile_cubit/profile_cubit.dart' as _i58;
import '../../features/quiz/data/quiz_remote_source.dart' as _i1036;
import '../../features/quiz/domain/quiz_repository.dart' as _i97;
import '../../features/quiz/quiz_cubit/quiz_cubit.dart' as _i533;
import '../cache/cache_store.dart' as _i457;
import '../config/app_config.dart' as _i650;
import '../general/connectivity_source.dart' as _i552;
import '../general/general_cubit/general_cubit.dart' as _i554;
import '../logging/app_logger.dart' as _i354;
import '../logging/data/log_repository.dart' as _i286;
import '../logging/logger.dart' as _i1008;
import '../navigation/app_router.dart' as _i630;
import '../navigation/navigation_cubit/navigation_cubit.dart' as _i824;
import '../network/api_client.dart' as _i557;
import '../network/interceptors/auth_interceptor.dart' as _i745;
import '../network/interceptors/logging_interceptor.dart' as _i344;
import '../network/token_provider.dart' as _i853;
import '../platform/platform_service.dart' as _i523;
import '../preferences/preferences_cubit/preferences_cubit.dart' as _i576;
import '../security/biometric_service.dart' as _i379;
import '../security/security_cubit/security_cubit.dart' as _i814;
import '../session/session_cubit/session_cubit.dart' as _i670;
import '../storage/local_store.dart' as _i465;
import '../storage/secure_storage.dart' as _i619;
import 'register_modules.dart' as _i8;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.sharedPreferences(),
      preResolve: true,
    );
    gh.lazySingleton<_i942.AppCubit>(() => _i942.AppCubit());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => registerModule.secureStorage,
    );
    gh.lazySingleton<_i650.AppConfig>(() => registerModule.appConfig());
    gh.lazySingleton<_i552.ConnectivitySource>(
      () => _i552.ConnectivitySource(),
    );
    gh.lazySingleton<_i457.CacheStore>(() => _i457.InMemoryCacheStore());
    gh.lazySingleton<_i619.SecureStorage>(
      () => _i619.SecureStorage(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i554.GeneralCubit>(
      () => _i554.GeneralCubit(gh<_i552.ConnectivitySource>()),
    );
    gh.lazySingleton<_i630.AppRouter>(
      () => _i630.AppRouter(gh<_i942.AppCubit>()),
    );
    gh.singleton<_i465.LocalStore>(
      () => _i465.LocalStore(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i824.NavigationCubit>(
      () => _i824.NavigationCubit(gh<_i630.AppRouter>()),
    );
    gh.lazySingleton<_i576.PreferencesCubit>(
      () =>
          _i576.PreferencesCubit(gh<_i465.LocalStore>(), gh<_i650.AppConfig>()),
    );
    gh.lazySingleton<_i853.TokenProvider>(
      () => _i853.JwtTokenProvider(gh<_i619.SecureStorage>()),
    );
    gh.lazySingleton<_i1008.Logger>(
      () => _i354.AppLogger(gh<_i650.AppConfig>()),
    );
    gh.lazySingleton<_i745.AuthInterceptor>(
      () => _i745.AuthInterceptor(gh<_i853.TokenProvider>()),
    );
    gh.lazySingleton<_i344.LoggingInterceptor>(
      () => _i344.LoggingInterceptor(gh<_i1008.Logger>()),
    );
    gh.lazySingleton<_i523.PlatformService>(
      () => _i523.PlatformService(gh<_i1008.Logger>()),
    );
    gh.lazySingleton<_i379.BiometricService>(
      () => _i379.BiometricService(gh<_i1008.Logger>()),
    );
    gh.lazySingleton<_i814.SecurityCubit>(
      () => _i814.SecurityCubit(
        gh<_i619.SecureStorage>(),
        gh<_i379.BiometricService>(),
      ),
    );
    gh.lazySingleton<_i361.Dio>(
      () => registerModule.dio(
        gh<_i650.AppConfig>(),
        gh<_i745.AuthInterceptor>(),
        gh<_i344.LoggingInterceptor>(),
      ),
    );
    gh.lazySingleton<_i557.ApiClient>(
      () => _i557.ApiClient(gh<_i361.Dio>(), gh<_i457.CacheStore>()),
    );
    gh.lazySingleton<_i286.LogRepository>(
      () => _i286.LogRepository(gh<_i557.ApiClient>()),
    );
    gh.lazySingleton<_i275.AuthRemoteSource>(
      () => _i275.AuthRemoteSource(gh<_i557.ApiClient>()),
    );
    gh.lazySingleton<_i642.LearnRemoteSource>(
      () => _i642.LearnRemoteSource(gh<_i557.ApiClient>()),
    );
    gh.lazySingleton<_i878.ProfileRemoteSource>(
      () => _i878.ProfileRemoteSource(gh<_i557.ApiClient>()),
    );
    gh.lazySingleton<_i1036.QuizRemoteSource>(
      () => _i1036.QuizRemoteSource(gh<_i557.ApiClient>()),
    );
    gh.lazySingleton<_i147.ProfileRepository>(
      () => registerModule.profileRepository(
        gh<_i650.AppConfig>(),
        gh<_i878.ProfileRemoteSource>(),
      ),
    );
    gh.lazySingleton<_i892.LearnRepository>(
      () => registerModule.learnRepository(
        gh<_i650.AppConfig>(),
        gh<_i642.LearnRemoteSource>(),
      ),
    );
    gh.lazySingleton<_i97.QuizRepository>(
      () => registerModule.quizRepository(
        gh<_i650.AppConfig>(),
        gh<_i1036.QuizRemoteSource>(),
      ),
    );
    gh.lazySingleton<_i996.AuthRepository>(
      () => registerModule.authRepository(
        gh<_i650.AppConfig>(),
        gh<_i275.AuthRemoteSource>(),
        gh<_i619.SecureStorage>(),
        gh<_i457.CacheStore>(),
      ),
    );
    gh.lazySingleton<_i637.LearnCubit>(
      () => _i637.LearnCubit(gh<_i892.LearnRepository>()),
    );
    gh.lazySingleton<_i533.QuizCubit>(
      () => _i533.QuizCubit(gh<_i97.QuizRepository>()),
    );
    gh.lazySingleton<_i670.SessionCubit>(
      () => _i670.SessionCubit(
        gh<_i996.AuthRepository>(),
        gh<_i619.SecureStorage>(),
        gh<_i942.AppCubit>(),
      ),
    );
    gh.lazySingleton<_i199.AuthCubit>(
      () =>
          _i199.AuthCubit(gh<_i996.AuthRepository>(), gh<_i670.SessionCubit>()),
    );
    gh.lazySingleton<_i58.ProfileCubit>(
      () => _i58.ProfileCubit(
        gh<_i147.ProfileRepository>(),
        gh<_i670.SessionCubit>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i8.RegisterModule {}
