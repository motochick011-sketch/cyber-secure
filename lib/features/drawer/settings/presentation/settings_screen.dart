import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/di/injector.dart';
import '../../../../core/di/locators.dart';
import '../../../../core/preferences/preferences_cubit/preferences_cubit.dart';
import '../../../../core/preferences/preferences_cubit/preferences_state.dart';
import '../../../../design_system/theme/theme_access.dart';
import '../../../../design_system/widgets/scaffolding/app_container.dart';
import '../../../../design_system/widgets/scaffolding/app_scaffold.dart';
import '../../../../design_system/widgets/text/title_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Settings',
      showBack: true,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _sectionHeader('Appearance'),
            SizedBox(height: appTokens.space12),
            _appearanceRow(),
            SizedBox(height: appTokens.space24),
            _sectionHeader('Session'),
            SizedBox(height: appTokens.space12),
            _logoutRow(),
            SizedBox(height: appTokens.space24),
            _sectionHeader('About'),
            SizedBox(height: appTokens.space12),
            _aboutRow(),
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return TitleWidget(title: title, size: TitleSize.small, titleColor: appColors.textSecondary);
  }

  Widget _appearanceRow() {
    return BlocBuilder<PreferencesCubit, PreferencesState>(
      bloc: getIt.preferences,
      builder: (context, _) {
        final mode = getIt.preferences.mode;
        final (icon, label) = switch (mode) {
          ThemeMode.light => (LucideIcons.sun, 'Light'),
          ThemeMode.dark => (LucideIcons.moon, 'Dark'),
          ThemeMode.system => (LucideIcons.monitor, 'System'),
        };

        return _settingsRow(icon: icon, title: 'Appearance', subtitle: 'Toggle light / dark ($label)', onTap: () => getIt.preferences.toggleBrightness());
      },
    );
  }

  Widget _logoutRow() {
    return _settingsRow(icon: LucideIcons.logOut, iconColor: appColors.error, title: 'Log out', titleColor: appColors.error, onTap: () => getIt.session.clear());
  }

  Widget _aboutRow() {
    return _settingsRow(icon: LucideIcons.info, title: 'CyberSecure', subtitle: 'Version 1.0.0', showChevron: false);
  }

  Widget _settingsRow({required IconData icon, required String title, String? subtitle, Color? iconColor, Color? titleColor, void Function()? onTap, bool showChevron = true}) {
    return AppContainer(
      width: double.infinity,
      padding: EdgeInsets.all(appTokens.space16),
      onTap: onTap,
      child: Row(
        children: [
          AppContainer(
            type: ContainerType.iconContainer,
            child: Icon(icon, color: iconColor ?? appColors.primary, size: 18),
          ),
          SizedBox(width: appTokens.space12),
          Expanded(
            child: TitleWidget(title: title, subtitle: subtitle, size: TitleSize.medium, titleColor: titleColor),
          ),
          if (showChevron && onTap != null) ...[SizedBox(width: appTokens.space8), Icon(LucideIcons.chevronRight, color: appColors.textSecondary, size: 20)],
        ],
      ),
    );
  }
}
