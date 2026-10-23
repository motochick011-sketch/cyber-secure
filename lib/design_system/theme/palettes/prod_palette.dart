import 'package:flutter/widgets.dart';

import '../app_colors.dart';
import '../brand_palette.dart';

const prodBrand = BrandPalette(
  light: AppColors(
    primary: Color(0xFF2962FF),
    secondary: Color(0xFF00B8D4),
    onPrimary: Color(0xFFFFFFFF),
    background: Color(0xFFF7F8FA),
    surface: Color(0xFFFFFFFF),
    textPrimary: Color(0xFF101418),
    textSecondary: Color(0xFF5B6572),
    border: Color(0xFFE2E6EB),
    error: Color(0xFFD32F2F),
    success: Color(0xFF2E7D32),
    warning: Color(0xFFED6C02),
    selected: Color(0xFF15FFAB),
    disabled: Color(0xFF9E9E9E),
  ),
  dark: AppColors(
    primary: Color(0xFF5B8DEF),
    secondary: Color(0xFF4DD0E1),
    onPrimary: Color(0xFF0A0C10),
    background: Color(0xFF0E1116),
    surface: Color(0xFF171B22),
    textPrimary: Color(0xFFF2F4F7),
    textSecondary: Color(0xFF9AA4B2),
    border: Color(0xFF2A2F3A),
    error: Color(0xFFEF5350),
    success: Color(0xFF66BB6A),
    warning: Color(0xFFFFA726),
    selected: Color(0xFF15FFAB),
    disabled: Color(0xFF9E9E9E),
  ),
);
