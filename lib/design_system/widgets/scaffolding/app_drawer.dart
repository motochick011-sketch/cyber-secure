import 'package:flutter/material.dart';

import '../../../core/di/injector.dart';
import '../../../core/navigation/navigation_cubit/navigation_cubit.dart';
import '../../../core/navigation/screen_id.dart';
import '../../theme/theme_access.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: appColors.surface,
      child: SafeArea(
        child: ListView(
          children: [
            for (final item in ScreenId.drawerItems)
              ListTile(
                leading: Icon(item.icon, color: appColors.textSecondary),
                title: Text(item.label, style: appStyles.body.copyWith(color: appColors.textPrimary)),
                onTap: () {
                  Navigator.of(context).pop();
                  getIt<NavigationCubit>().goTo(item);
                },
              ),
          ],
        ),
      ),
    );
  }
}
