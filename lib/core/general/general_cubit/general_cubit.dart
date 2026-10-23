import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../cubit/base_cubit.dart';
import '../../cubit/cubit_effect.dart';
import '../connectivity_source.dart';
import 'general_state.dart';

@lazySingleton
class GeneralCubit extends BaseCubit<GeneralData> {
  GeneralCubit(this._connectivity) : super(const GeneralData()) {
    _sub = _connectivity.onChange.listen((online) {
      setLoaded(state.data.copyWith(online: online));
      if (!online) {
        emitEffect(const ShowSnackbarEffect('You are offline', type: SnackbarType.warning));
      }
    });
  }

  final ConnectivitySource _connectivity;
  late final StreamSubscription<bool> _sub;

  bool get isOnline => state.data.online;

  void showSnackbar({String? title, required String message, SnackbarType type = SnackbarType.info}) {
    emitEffect(ShowSnackbarEffect(message, title: title, type: type));
  }

  @override
  Future<void> close() {
    _sub.cancel();
    return super.close();
  }
}
