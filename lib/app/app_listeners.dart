import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/cubit/cubit_effect.dart';
import '../core/di/injector.dart';
import '../core/di/locators.dart';
import '../core/general/general_cubit/general_cubit.dart';
import '../core/general/general_cubit/general_state.dart';
import 'app_cubit/app_cubit.dart';
import 'app_cubit/app_state.dart';

class AppRootListeners extends StatelessWidget {
  const AppRootListeners({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AppCubit, AppState>(
          listenWhen: (prev, curr) => curr.effect != null,
          listener: (context, state) {
            _handleGlobalEffect(context, state.effect!);
            getIt.app.clearEffect();
          },
        ),
        BlocListener<GeneralCubit, GeneralState>(
          listenWhen: (prev, curr) => curr.effect != null,
          listener: (context, state) {
            _handleGlobalEffect(context, state.effect!);
            getIt.general.clearEffect();
          },
        ),
      ],
      child: child,
    );
  }

  void _handleGlobalEffect(BuildContext context, CubitEffect effect) {
    switch (effect) {
      case ShowSnackbarEffect(:final message):
        ScaffoldMessenger.maybeOf(context)?.showSnackBar(SnackBar(content: Text(message), behavior: SnackBarBehavior.floating));
      case NavigateEffect(:final target):
        getIt.nav.goTo(target);
      case CloseScreenEffect():
        getIt.nav.pop();
    }
  }
}
