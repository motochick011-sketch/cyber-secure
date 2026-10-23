import 'package:cybersecure/app/app_cubit/app_cubit.dart';
import 'package:cybersecure/core/general/general_cubit/general_cubit.dart';
import 'package:cybersecure/core/navigation/navigation_cubit/navigation_cubit.dart';
import 'package:cybersecure/core/platform/platform_service.dart';
import 'package:cybersecure/core/preferences/preferences_cubit/preferences_cubit.dart';
import 'package:cybersecure/core/security/security_cubit/security_cubit.dart';
import 'package:cybersecure/core/session/session_cubit/session_cubit.dart';
import 'package:cybersecure/features/learn/learn_cubit/learn_cubit.dart';
import 'package:cybersecure/features/profile/profile_cubit/profile_cubit.dart';
import 'package:cybersecure/features/quiz/quiz_cubit/quiz_cubit.dart';
import 'package:get_it/get_it.dart';

extension AppLocators on GetIt {
  PreferencesCubit get preferences => this<PreferencesCubit>();

  AppCubit get app => this<AppCubit>();

  NavigationCubit get nav => this<NavigationCubit>();

  GeneralCubit get general => this<GeneralCubit>();

  SecurityCubit get security => this<SecurityCubit>();

  PlatformService get platform => this<PlatformService>();

  SessionCubit get session => this<SessionCubit>();

  ProfileCubit get profile => this<ProfileCubit>();

  QuizCubit get quiz => this<QuizCubit>();

  LearnCubit get learn => this<LearnCubit>();
}
