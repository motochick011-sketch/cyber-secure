import 'package:cybersecure/features/profile/presentation/profile_screen.dart';
import 'package:cybersecure/features/quiz/presentation/quiz_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../../app/app_cubit/app_cubit.dart';
import '../../app/app_cubit/app_state.dart';
import '../../design_system/widgets/scaffolding/app_shell.dart';
import '../../features/auth/presentation/forgot_password_screen.dart';
import '../../features/auth/presentation/landing_screen.dart';
import '../../features/auth/presentation/lock_screen.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/register_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/drawer/settings/presentation/settings_screen.dart';
import '../../features/learn/presentation/learn_screen.dart';
import '../../features/splash/presentation/splash_screen.dart';
import 'router_refresh.dart';
import 'screen_id.dart';

const String kSubScreenPath = '/_sub';

@lazySingleton
class AppRouter {
  AppRouter(this._appCubit);

  final AppCubit _appCubit;

  static final _rootKey = GlobalKey<NavigatorState>();
  static final _shellKey = GlobalKey<NavigatorState>();

  late final GoRouter config = GoRouter(
    navigatorKey: _rootKey,
    initialLocation: ScreenId.splash.path,
    refreshListenable: GoRouterRefreshStream(_appCubit.stream),
    redirect: _redirect,
    routes: [
      GoRoute(path: ScreenId.splash.path, builder: (_, _) => const SplashScreen()),
      GoRoute(path: ScreenId.landing.path, builder: (_, _) => const LandingScreen()),
      GoRoute(path: ScreenId.login.path, builder: (_, _) => const LoginScreen()),
      GoRoute(path: ScreenId.register.path, builder: (_, _) => const RegisterScreen()),
      GoRoute(path: ScreenId.forgot.path, builder: (_, _) => const ForgotPasswordScreen()),
      GoRoute(path: ScreenId.lock.path, builder: (_, _) => const LockScreen()),

      GoRoute(path: ScreenId.settings.path, builder: (_, _) => const SettingsScreen()),

      GoRoute(path: kSubScreenPath, parentNavigatorKey: _rootKey, builder: (context, state) => (state.extra as Widget Function())()),

      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => AppShell(navigationShell: shell),
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellKey,
            routes: [GoRoute(path: ScreenId.home.path, builder: (_, _) => const DashboardScreen())],
          ),
          StatefulShellBranch(
            routes: [GoRoute(path: ScreenId.learn.path, builder: (_, _) => const LearnScreen())],
          ),
          StatefulShellBranch(
            routes: [GoRoute(path: ScreenId.quiz.path, builder: (_, _) => const QuizScreen())],
          ),
          StatefulShellBranch(
            routes: [GoRoute(path: ScreenId.profile.path, builder: (_, _) => const ProfileScreen())],
          ),
        ],
      ),
    ],
  );

  String? _redirect(BuildContext context, GoRouterState state) {
    final app = _appCubit.appStatus;
    final goingTo = state.matchedLocation;
    final target = ScreenId.fromPath(goingTo);

    final onSplash = goingTo == ScreenId.splash.path;
    final onLock = goingTo == ScreenId.lock.path;

    if (app == AppStatus.initializing) {
      return onSplash ? null : ScreenId.splash.path;
    }

    if (app == AppStatus.locked) {
      return onLock ? null : ScreenId.lock.path;
    }

    if (app == AppStatus.unauthenticated) {
      const authFlow = {ScreenId.landing, ScreenId.login, ScreenId.register, ScreenId.forgot};
      final isAuthFlow = target != null && authFlow.contains(target);
      return isAuthFlow ? null : ScreenId.landing.path;
    }

    if (app == AppStatus.authenticated) {
      final isAuthFlow = target?.kind == ScreenKind.flow;
      if (isAuthFlow || onSplash || onLock) return ScreenId.home.path;
    }

    return null;
  }
}
