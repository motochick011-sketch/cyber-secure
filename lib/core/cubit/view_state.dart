import 'package:freezed_annotation/freezed_annotation.dart';

import '../error/app_error.dart';
import 'cubit_effect.dart';

part 'view_state.freezed.dart';

enum Status { initial, loading, loaded, failure }

@freezed
abstract class ViewState<T> with _$ViewState<T> {
  const factory ViewState({required T data, @Default(Status.initial) Status status, AppError? error, CubitEffect? effect}) = _ViewState<T>;

  factory ViewState.initial(T data) => ViewState<T>(data: data);
}
