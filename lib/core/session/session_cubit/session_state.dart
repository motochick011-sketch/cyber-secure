import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../features/auth/domain/models/user.dart';
import '../../cubit/view_state.dart';

part 'session_state.freezed.dart';

@freezed
abstract class SessionData with _$SessionData {
  const factory SessionData({User? user}) = _SessionData;
}

typedef SessionState = ViewState<SessionData>;
