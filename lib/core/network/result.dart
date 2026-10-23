import '../error/app_error.dart';

sealed class Result<T> {
  const Result();
}

class Success<T> extends Result<T> {
  const Success(this.value);

  final T value;
}

class Failure<T> extends Result<T> {
  const Failure(this.error);

  final AppError error;
}

extension ResultX<T> on Result<T> {
  Result<R> map<R>(R Function(T value) f) => switch (this) {
    Success(:final value) => Success(f(value)),
    Failure(:final error) => Failure(error),
  };

  bool get isSuccess => this is Success<T>;

  T? get valueOrNull => switch (this) {
    Success(:final value) => value,
    Failure() => null,
  };
}
