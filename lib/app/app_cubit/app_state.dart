import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/cubit/view_state.dart';

part 'app_state.freezed.dart';

enum AppStatus { initializing, unauthenticated, authenticated, locked, error }

@freezed
abstract class AppData with _$AppData {
  const factory AppData({@Default(AppStatus.initializing) AppStatus appStatus}) = _AppData;
}

typedef AppState = ViewState<AppData>;
