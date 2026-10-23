import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/navigation/screen_id.dart';
import '../../theme/theme_access.dart';
import 'app_bottom_nav.dart';
import 'app_drawer.dart';

class AppShell extends StatelessWidget {
  const AppShell({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final activeTab = ScreenId.tabs[navigationShell.currentIndex];

    return Scaffold(
      backgroundColor: appColors.background,
      drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: appColors.surface,
        foregroundColor: appColors.textPrimary,
        title: Text(activeTab.label, style: appStyles.title.copyWith(color: appColors.textPrimary)),
      ),
      body: SafeArea(
        child: Padding(padding: appTokens.screenPadding, child: navigationShell),
      ),
      bottomNavigationBar: AppBottomNav(
        currentIndex: navigationShell.currentIndex,
        onTap: (i) => navigationShell.goBranch(i, initialLocation: i == navigationShell.currentIndex),
      ),
    );
  }
}
