import 'package:freezed_annotation/freezed_annotation.dart';

import '../cubit/cubit_effect.dart';

part 'app_error.freezed.dart';

enum ErrorKind { network, timeout, unauthorized, notFound, server, validation, offline, unknown }

@freezed
abstract class AppError with _$AppError {
  const factory AppError({required ErrorKind kind, required String message, String? code, Object? cause}) = _AppError;

  const AppError._();

  factory AppError.unknown([Object? cause]) => AppError(kind: ErrorKind.unknown, message: 'Something went wrong', cause: cause);

  ShowSnackbarEffect toSnackbarEffect() => switch (kind) {
    ErrorKind.offline => const ShowSnackbarEffect('You are offline', type: SnackbarType.warning),
    ErrorKind.validation => ShowSnackbarEffect(message, type: SnackbarType.error),
    ErrorKind.server => const ShowSnackbarEffect('Something went wrong', type: SnackbarType.error),
    _ => ShowSnackbarEffect(message, type: SnackbarType.error),
  };
}
