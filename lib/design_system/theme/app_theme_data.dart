import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';
import 'app_tokens.dart';

@immutable
class AppThemeData {
  const AppThemeData({required this.colors, required this.styles, required this.tokens, required this.material, required this.brightness});

  final AppColors colors;
  final AppTextStyles styles;
  final AppTokens tokens;

  final ThemeData material;

  final Brightness brightness;
}
