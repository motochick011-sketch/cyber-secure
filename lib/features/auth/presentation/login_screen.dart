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
import '../../../design_system/widgets/inputs/app_password_text_field.dart';
import '../../../design_system/widgets/scaffolding/app_scaffold.dart';
import '../../../design_system/widgets/text/title_widget.dart';
import '../auth_cubit/auth_cubit.dart';
import '../auth_cubit/auth_state.dart';
import 'widgets/auth_link.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  bool _emailValid = false;
  bool _passwordValid = false;

  bool get _canSubmit => _emailValid && _passwordValid;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_canSubmit) return;
    getIt<AuthCubit>().login(email: _email.text, password: _password.text);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Login',
      showBack: true,
      child: BlocBuilder<AuthCubit, AuthState>(
        bloc: getIt<AuthCubit>(),
        builder: (context, state) {
          final loading = state.status == Status.loading;
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: appTokens.space24),
                TitleWidget(
                  title: 'Welcome back',
                  subtitle: 'Sign in to pick up where you left off.',
                  size: TitleSize.extraLarge,
                  titleColor: appColors.textPrimary,
                  subtitleColor: appColors.textSecondary,
                  titleSubtitleSpacing: appTokens.space8,
                ),
                SizedBox(height: appTokens.space32),
                AppEmailTextField(controller: _email, isEnabled: !loading, onChanged: (value) => setState(() => _emailValid = Validators.isValidEmail(value))),
                SizedBox(height: appTokens.space16),
                AppPasswordTextField(controller: _password, onChanged: (_, isValid) => setState(() => _passwordValid = isValid)),
                if (state.status == Status.failure) ...[SizedBox(height: appTokens.space12), Text(state.error?.message ?? 'Login failed', style: appStyles.caption.copyWith(color: appColors.error))],
                SizedBox(height: appTokens.space16),
                AuthLink(action: 'Forgot password', onTap: () => getIt.nav.goTo(ScreenId.forgot)),
                SizedBox(height: appTokens.space24),
                AppTextButton(text: 'Sign in', isLoading: loading, isDisabled: !_canSubmit, onPressed: _submit),
                SizedBox(height: appTokens.space16),
                AuthLink(prefix: 'Don\'t have an account?', action: 'Register', onTap: () => getIt.nav.goTo(ScreenId.register)),
                SizedBox(height: appTokens.space24),
              ],
            ),
          );
        },
      ),
    );
  }
}
