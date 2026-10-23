import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';
import 'core/di/injector.dart';
import 'core/di/locators.dart';
import 'core/logging/logger.dart';
import 'core/network/interceptors/auth_interceptor.dart';
import 'core/security/security_cubit/security_cubit.dart';
import 'core/session/session_cubit/session_cubit.dart';

Future<void> bootstrap() async {
  FlutterError.onError = (details) {
    _logFatal(details.exception, details.stack);
  };

  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await configureDependencies();

    getIt<AuthInterceptor>().onSessionExpired = () => getIt.session.clear();

    unawaited(getIt<SecurityCubit>().load());

    runApp(const App());

    unawaited(getIt<SessionCubit>().hydrate());
  }, (error, stack) => _logFatal(error, stack));
}

void _logFatal(Object error, StackTrace? stack) {
  if (getIt.isRegistered<Logger>()) {
    getIt<Logger>().error(error, stack);
  } else if (kDebugMode) {
    debugPrint('[bootstrap] uncaught error (pre-DI): $error');
    if (stack != null) debugPrint(stack.toString());
  }
}
