import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cybersecure/design_system/theme/theme_access.dart';
import 'package:cybersecure/design_system/widgets/feedback/loading_indicator.dart';

class AppTextButton extends StatelessWidget {
  final Function() onPressed;
  final Function(bool hovering)? onHover;
  final String text;
  final bool isLoading;
  final bool isSecondary;
  final bool isDisabled;
  final Gradient? gradient;
  final String? svgIcon;

  final bool isSmall;

  const AppTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.onHover,
    this.isLoading = false,
    this.isDisabled = false,
    this.isSecondary = false,
    this.isSmall = false,
    this.gradient,
    this.svgIcon,
  });

  bool get _inactive => isDisabled || isLoading;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(appTokens.radius12);

    final Color? fillColor = _inactive
        ? appColors.disabled
        : isSecondary
        ? appColors.overlayFaint
        : null;
    final Gradient? fillGradient = (_inactive || isSecondary) ? null : (gradient ?? appColors.primaryGradient);
    final Color foreground = isSecondary && !_inactive ? appColors.textPrimary : appColors.onPrimary;

    return Container(
      decoration: BoxDecoration(
        borderRadius: radius,
        color: fillColor,
        gradient: fillGradient,
        border: isSecondary && !_inactive ? Border.all(color: appColors.overlayLight, width: 1) : null,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: radius,
        child: InkWell(
          borderRadius: radius,
          onTap: _inactive ? null : onPressed,
          onHover: onHover,
          child: SizedBox(
            height: isSmall ? 40 : 52,
            child: Center(child: _content(foreground)),
          ),
        ),
      ),
    );
  }

  Widget _content(Color foreground) {
    if (isLoading) {
      return const SizedBox(height: 20, width: 20, child: LoadingIndicator());
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (svgIcon != null) ...[SvgPicture.asset(svgIcon!, height: 20, width: 20), const SizedBox(width: 8)],
        Flexible(
          child: Text(
            text,
            textAlign: TextAlign.center,
            softWrap: true,
            style: appStyles.body.copyWith(color: foreground),
          ),
        ),
      ],
    );
  }
}
