import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/cubit/view_state.dart';
import '../../../core/di/injector.dart';
import '../../../core/di/locators.dart';
import '../../../core/navigation/screen_id.dart';
import '../../../core/validation/validators.dart';
import '../../../design_system/theme/theme_access.dart';
import '../../../design_system/widgets/buttons/app_text_button.dart';
import '../../../design_system/widgets/inputs/app_email_text_field.dart';
import '../../../design_system/widgets/scaffolding/app_scaffold.dart';
import '../auth_cubit/auth_cubit.dart';
import '../auth_cubit/auth_state.dart';
import 'widgets/auth_link.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _email = TextEditingController();
  bool _emailValid = false;

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_emailValid) return;
    getIt<AuthCubit>().forgotPassword(email: _email.text);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Forgot password',
      showBack: true,
      child: BlocBuilder<AuthCubit, AuthState>(
        bloc: getIt<AuthCubit>(),
        builder: (context, state) {
          final loading = state.status == Status.loading;

          if (state.data.resetEmailSent) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.mark_email_read_outlined, size: 48, color: appColors.success),
                  SizedBox(height: appTokens.space16),
                  Text(
                    'Check your email for a reset link',
                    textAlign: TextAlign.center,
                    style: appStyles.body.copyWith(color: appColors.textPrimary),
                  ),
                  SizedBox(height: appTokens.space24),
                  AuthLink(action: 'Back to login', onTap: () => getIt.nav.goTo(ScreenId.login)),
                ],
              ),
            );
          }

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Reset password', style: appStyles.title.copyWith(color: appColors.textPrimary)),
              SizedBox(height: appTokens.space16),
              AppEmailTextField(controller: _email, isEnabled: !loading, onChanged: (value) => setState(() => _emailValid = Validators.isValidEmail(value))),
              if (state.status == Status.failure) ...[SizedBox(height: appTokens.space12), Text(state.error?.message ?? 'Request failed', style: appStyles.caption.copyWith(color: appColors.error))],
              SizedBox(height: appTokens.space24),
              AppTextButton(text: 'Send reset link', isLoading: loading, isDisabled: !_emailValid, onPressed: _submit),
              SizedBox(height: appTokens.space16),
              AuthLink(action: 'Back to login', onTap: () => getIt.nav.goTo(ScreenId.login)),
            ],
          );
        },
      ),
    );
  }
}
