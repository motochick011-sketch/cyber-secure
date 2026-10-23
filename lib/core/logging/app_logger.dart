import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../config/app_config.dart';
import '../di/injector.dart';
import 'data/log_repository.dart';
import 'log_record.dart';
import 'logger.dart';

@LazySingleton(as: Logger)
class AppLogger implements Logger {
  AppLogger(this._config);

  final AppConfig _config;

  @override
  void log(LogLevel level, String message, {Object? error, StackTrace? stack, Map<String, Object?>? data}) {
    final record = LogRecord(level, message, error: error, stack: stack, data: data);

    if (kDebugMode) {
      debugPrint('[${level.name}] $message${error != null ? ' | $error' : ''}');
      if (stack != null) debugPrint(stack.toString());
    }

    if (_config.remoteLoggingEnabled) {
      unawaited(_safeSend(record));
    }
  }

  Future<void> _safeSend(LogRecord record) async {
    try {
      await getIt<LogRepository>().sendLog(record);
    } catch (_) {}
  }

  @override
  void debug(String message) => log(LogLevel.debug, message);

  @override
  void info(String message) => log(LogLevel.info, message);

  @override
  void warn(String message, [Object? error]) => log(LogLevel.warn, message, error: error);

  @override
  void error(Object error, [StackTrace? stack]) => log(LogLevel.error, 'error', error: error, stack: stack);
}
