import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cybersecure/core/di/injector.dart';
import 'package:cybersecure/core/di/locators.dart';
import 'package:cybersecure/design_system/theme/app_text_styles.dart';
import 'package:cybersecure/design_system/theme/theme_access.dart';

enum TitleSize { extraSmall, small, medium, large, extraLarge }

class TitleWidget extends StatelessWidget {
  final String? title;
  final Widget? wTitle;
  final String? subtitle;
  final Widget? child;
  final bool isWarning;
  final TitleSize size;
  final TextOverflow? overflow;
  final CrossAxisAlignment align;
  final TextAlign? textAlign;
  final bool isHyperText;
  final Color? subtitleColor;
  final Color? titleColor;
  final MainAxisSize mainAxisSize;
  final FontWeight? fontWeight;
  final double? titleSubtitleSpacing;

  const TitleWidget({
    super.key,
    this.title,
    this.wTitle,
    this.subtitle,
    this.subtitleColor,
    this.titleColor,
    this.align = CrossAxisAlignment.start,
    this.textAlign,
    this.isWarning = false,
    this.size = TitleSize.medium,
    this.overflow,
    this.child,
    this.isHyperText = false,
    this.mainAxisSize = MainAxisSize.max,
    this.fontWeight,
    this.titleSubtitleSpacing,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle;
    switch (size) {
      case TitleSize.small:
        titleStyle = appStyles.caption.bold;
        break;
      case TitleSize.medium:
        titleStyle = appStyles.body.bold;
        break;
      case TitleSize.large:
        titleStyle = appStyles.title.bold;
        break;
      case TitleSize.extraLarge:
        titleStyle = appStyles.display.bold;
        break;
      case TitleSize.extraSmall:
        titleStyle = appStyles.hint.bold;
    }
    if (fontWeight != null) titleStyle = titleStyle.copyWith(fontWeight: fontWeight);
    if (titleColor != null) titleStyle = titleStyle.copyWith(color: titleColor);

    TextStyle subtitleStyle;
    switch (size) {
      case TitleSize.small:
        subtitleStyle = isWarning ? appStyles.hint.copyWith(color: appColors.warning) : appStyles.hint.copyWith(color: subtitleColor ?? appColors.overlayStrong);
        break;
      case TitleSize.medium:
        subtitleStyle = isWarning ? appStyles.caption.copyWith(color: appColors.warning) : appStyles.caption.copyWith(color: subtitleColor ?? appColors.overlayStrong);
        break;
      case TitleSize.large:
        subtitleStyle = appStyles.body.bold.copyWith(color: subtitleColor ?? appColors.overlayStrong);
        break;
      case TitleSize.extraLarge:
        subtitleStyle = appStyles.body.bold.copyWith(color: subtitleColor ?? appColors.overlayStrong);
        break;
      case TitleSize.extraSmall:
        subtitleStyle = isWarning ? appStyles.overline.copyWith(color: appColors.warning) : appStyles.overline.copyWith(color: subtitleColor ?? appColors.overlayStrong);
    }

    return Column(
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: align,
      children: [
        if (title?.isNotEmpty ?? false) Text(title!, style: titleStyle, overflow: overflow ?? TextOverflow.ellipsis, textAlign: textAlign),
        if ((title?.isNotEmpty ?? false) && (subtitle?.isNotEmpty ?? false)) SizedBox(height: titleSubtitleSpacing ?? 0),
        if (subtitle?.isNotEmpty ?? false) isHyperText ? _buildHyperText(subtitle!, subtitleStyle) : Text(subtitle!, style: subtitleStyle, overflow: overflow, textAlign: textAlign),
        ?wTitle,
        ?child,
      ],
    );
  }

  Widget _buildHyperText(String text, TextStyle baseStyle) {
    final urlPattern = RegExp(r'https?://[^\s,;:!?()]+(?<![.])');
    final matches = urlPattern.allMatches(text);

    if (matches.isEmpty) return Text(text, style: baseStyle, overflow: overflow);

    List<TextSpan> spans = [];
    int lastEnd = 0;

    for (final match in matches) {
      if (match.start > lastEnd) {
        spans.add(TextSpan(text: text.substring(lastEnd, match.start), style: baseStyle));
      }

      final url = match.group(0)!;
      spans.add(
        TextSpan(
          text: url,
          style: baseStyle.copyWith(color: appColors.primary, decoration: TextDecoration.underline, decorationColor: appColors.primary),
          recognizer: TapGestureRecognizer()..onTap = () => getIt.platform.openUrl(url),
        ),
      );
      lastEnd = match.end;
    }

    if (lastEnd < text.length) spans.add(TextSpan(text: text.substring(lastEnd), style: baseStyle));

    return Text.rich(
      TextSpan(children: spans),
      style: baseStyle,
      overflow: overflow,
    );
  }
}
