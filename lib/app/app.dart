import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/di/injector.dart';
import '../core/di/locators.dart';
import '../core/general/general_cubit/general_cubit.dart';
import '../core/navigation/app_router.dart';
import '../core/preferences/preferences_cubit/preferences_cubit.dart';
import '../core/preferences/preferences_cubit/preferences_state.dart';
import 'app_listeners.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt.app),
        BlocProvider.value(value: getIt.preferences),
        BlocProvider.value(value: getIt<GeneralCubit>()),
      ],
      child: BlocBuilder<PreferencesCubit, PreferencesState>(
        bloc: getIt.preferences,
        builder: (context, state) {
          final theme = state.data.theme;
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'CyberSecure',
            theme: theme.material,
            routerConfig: getIt<AppRouter>().config,
            builder: (context, child) => AppRootListeners(child: child!),
          );
        },
      ),
    );
  }
}
