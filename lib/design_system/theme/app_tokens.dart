import 'package:flutter/widgets.dart';

@immutable
class AppTokens {
  const AppTokens();

  double get space4 => 4;

  double get space8 => 8;

  double get space12 => 12;

  double get space16 => 16;

  double get space24 => 24;

  double get space32 => 32;

  double get radius8 => 8;

  double get radius12 => 12;

  double get radius20 => 20;

  double get radius24 => 24;

  EdgeInsets get screenPadding => EdgeInsets.symmetric(horizontal: space16);

  Duration get fast => const Duration(milliseconds: 150);

  Duration get normal => const Duration(milliseconds: 300);
}

const AppTokens appTokens = AppTokens();
