import 'logger.dart';

class LogRecord {
  LogRecord(this.level, this.message, {this.error, this.stack, this.data, DateTime? time}) : time = time ?? DateTime.now();

  final LogLevel level;
  final String message;
  final Object? error;
  final StackTrace? stack;
  final Map<String, Object?>? data;
  final DateTime time;

  Map<String, dynamic> toJson() => {'level': level.name, 'message': message, 'time': time.toIso8601String(), if (error != null) 'error': error.toString(), if (data != null) 'data': data};
}
