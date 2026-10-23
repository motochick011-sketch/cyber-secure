import 'package:flutter_bloc/flutter_bloc.dart';

import '../error/app_error.dart';
import 'cubit_effect.dart';
import 'view_state.dart';

abstract class BaseCubit<T> extends Cubit<ViewState<T>> {
  BaseCubit(T initial) : super(ViewState<T>.initial(initial));

  @override
  void emit(ViewState<T> state) {
    if (!isClosed) super.emit(state);
  }

  void setLoading() => emit(state.copyWith(status: Status.loading, effect: null));

  void setLoaded(T data) => emit(state.copyWith(data: data, status: Status.loaded, effect: null));

  void setFailure(AppError error, {bool snackbar = false}) {
    emit(state.copyWith(status: Status.failure, error: error, effect: null));
    if (snackbar) emitEffect(error.toSnackbarEffect());
  }

  void emitEffect(CubitEffect effect) => emit(state.copyWith(effect: effect));

  void clearEffect() => emit(state.copyWith(effect: null));
}
