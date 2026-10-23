import 'package:flutter/material.dart';

import '../../../design_system/theme/theme_access.dart';
import '../../../design_system/widgets/scaffolding/app_scaffold.dart';

class LockScreen extends StatelessWidget {
  const LockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.lock_outline, size: 48, color: appColors.primary),
            SizedBox(height: appTokens.space16),
            Text('Locked', style: appStyles.heading.copyWith(color: appColors.textPrimary)),
          ],
        ),
      ),
    );
  }
}
