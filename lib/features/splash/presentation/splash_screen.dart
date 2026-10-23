import 'package:flutter/material.dart';

import '../../../design_system/theme/theme_access.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.background,
      body: Center(child: CircularProgressIndicator(color: appColors.primary)),
    );
  }
}
