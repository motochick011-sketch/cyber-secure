import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/cubit/view_state.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthData with _$AuthData {
  const factory AuthData({@Default(false) bool resetEmailSent}) = _AuthData;
}

typedef AuthState = ViewState<AuthData>;
