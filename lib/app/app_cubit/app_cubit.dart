import 'package:injectable/injectable.dart';

import '../../core/cubit/base_cubit.dart';
import '../../core/cubit/view_state.dart';
import 'app_state.dart';

@lazySingleton
class AppCubit extends BaseCubit<AppData> {
  AppCubit() : super(const AppData());

  AppStatus get appStatus => state.data.appStatus;

  void onAuthenticated() => _set(AppStatus.authenticated);

  void onUnauthenticated() => _set(AppStatus.unauthenticated);

  void onLocked() => _set(AppStatus.locked);

  void onStartupError() => _set(AppStatus.error);

  void _set(AppStatus s) => emit(
    state.copyWith(
      status: Status.loaded,
      data: state.data.copyWith(appStatus: s),
    ),
  );
}
