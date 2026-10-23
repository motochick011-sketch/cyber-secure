import 'package:flutter/widgets.dart';

const String? kAppFontFamily = null;

@immutable
class AppTextStyles {
  const AppTextStyles({
    required this.display,
    required this.heading,
    required this.title,
    required this.subtitle,
    required this.body,
    required this.caption,
    required this.hint,
    required this.overline,
  });

  final TextStyle display;
  final TextStyle heading;
  final TextStyle title;
  final TextStyle subtitle;
  final TextStyle body;
  final TextStyle caption;
  final TextStyle hint;
  final TextStyle overline;
}

extension TextStyleWeight on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
}

const AppTextStyles appTextStyles = AppTextStyles(
  display: TextStyle(fontFamily: kAppFontFamily, fontSize: 30, fontWeight: FontWeight.normal, height: 1.2),
  heading: TextStyle(fontFamily: kAppFontFamily, fontSize: 24, fontWeight: FontWeight.normal, height: 1.25),
  title: TextStyle(fontFamily: kAppFontFamily, fontSize: 20, fontWeight: FontWeight.normal, height: 1.3),
  subtitle: TextStyle(fontFamily: kAppFontFamily, fontSize: 16, fontWeight: FontWeight.normal, height: 1.35),
  body: TextStyle(fontFamily: kAppFontFamily, fontSize: 14, fontWeight: FontWeight.normal, height: 1.45),
  caption: TextStyle(fontFamily: kAppFontFamily, fontSize: 12, fontWeight: FontWeight.normal, height: 1.3),
  hint: TextStyle(fontFamily: kAppFontFamily, fontSize: 11, fontWeight: FontWeight.normal, height: 1.3),
  overline: TextStyle(fontFamily: kAppFontFamily, fontSize: 10, fontWeight: FontWeight.normal, height: 1.3),
);
