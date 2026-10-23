import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injector.dart';
import '../../../core/di/locators.dart';
import '../../../core/preferences/preferences_cubit/preferences_cubit.dart';
import '../../../core/preferences/preferences_cubit/preferences_state.dart';
import '../../theme/theme_access.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({required this.child, this.title, this.showBack = false, this.actions, this.padding, this.bottomNavigationBar, this.drawer, super.key}) : _noPadding = false;

  const AppScaffold.noPadding({required this.child, this.title, this.showBack = false, this.actions, this.bottomNavigationBar, this.drawer, super.key}) : padding = null, _noPadding = true;

  final Widget child;
  final String? title;
  final bool showBack;
  final List<Widget>? actions;
  final EdgeInsets? padding;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final bool _noPadding;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesCubit, PreferencesState>(
      bloc: getIt.preferences,
      builder: (context, _) {
        final effectivePadding = _noPadding ? EdgeInsets.zero : (padding ?? appTokens.screenPadding);

        return Scaffold(
          backgroundColor: appColors.background,
          drawer: drawer,
          appBar: (title != null || showBack || actions != null)
              ? AppBar(
                  backgroundColor: appColors.surface,
                  foregroundColor: appColors.textPrimary,
                  automaticallyImplyLeading: showBack,
                  title: title == null ? null : Text(title!, style: appStyles.title.copyWith(color: appColors.textPrimary)),
                  actions: actions,
                )
              : null,
          body: SafeArea(
            child: Padding(padding: effectivePadding, child: child),
          ),
          bottomNavigationBar: bottomNavigationBar,
        );
      },
    );
  }
}
