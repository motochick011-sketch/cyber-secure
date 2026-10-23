import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';
import 'app_theme_data.dart';
import 'app_tokens.dart';
import 'brand.dart';
import 'brand_registry.dart';

abstract final class AppTheme {
  static AppThemeData light(Brand brand) => _build(paletteFor(brand).light, Brightness.light);

  static AppThemeData dark(Brand brand) => _build(paletteFor(brand).dark, Brightness.dark);

  static AppThemeData _build(AppColors c, Brightness b) {
    return AppThemeData(
      colors: c,
      styles: appTextStyles,
      tokens: appTokens,
      brightness: b,
      material: ThemeData(
        useMaterial3: true,
        brightness: b,
        scaffoldBackgroundColor: c.background,
        colorScheme: ColorScheme.fromSeed(seedColor: c.primary, brightness: b).copyWith(primary: c.primary, onPrimary: c.onPrimary, surface: c.surface, error: c.error),

        textTheme: TextTheme(
          headlineLarge: appTextStyles.display.copyWith(color: c.textPrimary),
          headlineSmall: appTextStyles.heading.copyWith(color: c.textPrimary),
          titleMedium: appTextStyles.title.copyWith(color: c.textPrimary),
          bodyMedium: appTextStyles.body.copyWith(color: c.textPrimary),
          labelLarge: appTextStyles.subtitle.copyWith(color: c.onPrimary),
        ),
      ),
    );
  }
}
