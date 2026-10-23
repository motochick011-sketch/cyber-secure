import 'package:freezed_annotation/freezed_annotation.dart';

import '../../cubit/view_state.dart';

part 'security_state.freezed.dart';

@freezed
abstract class SecurityData with _$SecurityData {
  const factory SecurityData({@Default(false) bool pinEnabled, @Default(false) bool biometricEnabled, @Default(false) bool unlocked}) = _SecurityData;
}

typedef SecurityState = ViewState<SecurityData>;
