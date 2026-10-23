import 'package:flutter/foundation.dart';

import 'app_colors.dart';

@immutable
class BrandPalette {
  const BrandPalette({required this.light, required this.dark});

  final AppColors light;
  final AppColors dark;
}
