import '../../core/di/injector.dart';
import '../../core/di/locators.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';
import 'app_tokens.dart';

AppColors get appColors => getIt.preferences.theme.colors;

AppTextStyles get appStyles => getIt.preferences.theme.styles;

AppTokens get appTokens => getIt.preferences.theme.tokens;
