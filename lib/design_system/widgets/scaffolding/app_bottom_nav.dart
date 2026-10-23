import 'package:flutter/material.dart';

import '../../../core/navigation/screen_id.dart';
import '../../theme/theme_access.dart';

class AppBottomNav extends StatelessWidget {
  const AppBottomNav({required this.currentIndex, required this.onTap, super.key});

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      backgroundColor: appColors.surface,
      destinations: [for (final tab in ScreenId.tabs) NavigationDestination(icon: Icon(tab.icon), label: tab.label)],
    );
  }
}
