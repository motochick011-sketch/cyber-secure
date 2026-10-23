enum LogLevel { debug, info, warn, error }

abstract interface class Logger {
  void log(LogLevel level, String message, {Object? error, StackTrace? stack, Map<String, Object?>? data});

  void debug(String message);

  void info(String message);

  void warn(String message, [Object? error]);

  void error(Object error, [StackTrace? stack]);
}
