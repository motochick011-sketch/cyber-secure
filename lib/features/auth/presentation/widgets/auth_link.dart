import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cybersecure/design_system/theme/app_text_styles.dart';

import '../../../../design_system/theme/theme_access.dart';

class AuthLink extends StatelessWidget {
  const AuthLink({required this.action, required this.onTap, this.prefix, super.key});

  final String? prefix;

  final String action;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          if (prefix != null)
            TextSpan(
              text: '$prefix ',
              style: appStyles.caption.copyWith(color: appColors.overlayStrong),
            ),
          TextSpan(
            text: action,
            style: appStyles.caption.bold.copyWith(color: appColors.primary),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
