import 'package:cybersecure/design_system/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../core/di/injector.dart';
import '../../../core/di/locators.dart';
import '../../../core/navigation/screen_id.dart';
import '../../../design_system/theme/theme_access.dart';
import '../../../design_system/widgets/buttons/app_text_button.dart';
import '../../../design_system/widgets/scaffolding/app_scaffold.dart';
import '../../../generated/assets.gen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: MediaQuery.sizeOf(context).height - MediaQuery.paddingOf(context).vertical),
          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                Assets.png.cyberSecureShieldLogo.image(height: 120, fit: BoxFit.contain),
                SizedBox(height: appTokens.space24),
                Text(
                  'CyberSecure',
                  textAlign: TextAlign.center,
                  style: appStyles.display.bold.copyWith(color: appColors.textPrimary),
                ),
                SizedBox(height: appTokens.space8),
                Text(
                  'Learn. Practice. Stay safe.',
                  textAlign: TextAlign.center,
                  style: appStyles.subtitle.copyWith(color: appColors.textSecondary),
                ),
                const Spacer(),
                AppTextButton(text: 'Log in', onPressed: () => getIt.nav.goTo(ScreenId.login)),
                SizedBox(height: appTokens.space12),
                AppTextButton(text: 'Create an account', isSecondary: true, onPressed: () => getIt.nav.goTo(ScreenId.register)),
                SizedBox(height: appTokens.space24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
