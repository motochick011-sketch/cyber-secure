import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cybersecure/design_system/theme/theme_access.dart';

enum ContainerType {
  errorWarning,
  primaryColor,
  primary,
  disabled,
  warning,
  secondary,
  selected,
  url,
  qr,
  noContainer,
  error,
  borderOnly,
  errorInput,
  iconContainer,
  accent,
  label,
  tab;

  const ContainerType();

  Color get backgroundColor {
    switch (this) {
      case ContainerType.primaryColor:
        return appColors.primary;
      case ContainerType.primary:
      case ContainerType.disabled:
        return appColors.primaryTint;
      case ContainerType.warning:
        return appColors.warning.withValues(alpha: 0.2);
      case ContainerType.errorWarning:
        return appColors.error;
      case ContainerType.errorInput:
        return appColors.error.withAlpha(60);
      case ContainerType.error:
        return appColors.primaryTint;
      case ContainerType.secondary:
        return appColors.primary;
      case ContainerType.selected:
        return appColors.primaryTint;
      case ContainerType.url:
        return appColors.primary.withValues(alpha: 0.1);
      case ContainerType.qr:
        return appColors.overlayBase;
      case ContainerType.iconContainer:
        return appColors.primary.withValues(alpha: 0.10);
      case ContainerType.accent:
        return appColors.primary.withValues(alpha: 0.1);
      case ContainerType.tab:
        return appColors.overlayFaint;
      case ContainerType.label:
      case ContainerType.noContainer:
      case ContainerType.borderOnly:
        return Colors.transparent;
    }
  }

  Color get borderColor {
    switch (this) {
      case ContainerType.primaryColor:
        return appColors.primary;
      case ContainerType.primary:
      case ContainerType.disabled:
      case ContainerType.errorInput:
        return appColors.primaryTint;
      case ContainerType.errorWarning:
      case ContainerType.error:
        return appColors.error;
      case ContainerType.borderOnly:
        return appColors.overlayMuted;
      case ContainerType.warning:
        return appColors.warning.withValues(alpha: 0.2);

      case ContainerType.secondary:
        return appColors.primary;
      case ContainerType.selected:
        return appColors.selected;
      case ContainerType.url:
        return appColors.primary.withValues(alpha: 0.1);
      case ContainerType.qr:
        return appColors.overlayBase;
      case ContainerType.iconContainer:
        return appColors.primary.withValues(alpha: 0.10);
      case ContainerType.accent:
        return appColors.primary;
      case ContainerType.tab:
        return appColors.overlayLight;
      case ContainerType.label:
      case ContainerType.noContainer:
        return Colors.transparent;
    }
  }
}

class AppContainer extends StatelessWidget {
  final Widget child;
  final double? blurSigma;
  final EdgeInsets? padding;
  final double? borderRadius;
  final BorderRadius? borderRadiusGeometry;
  final void Function()? onTap;
  final ContainerType? type;
  final BoxShape? shape;
  final double? height;
  final double? width;
  final Color? splashColor;
  final Color? containerColor;
  final Color? color;

  const AppContainer({
    super.key,
    required this.child,
    this.blurSigma,
    this.padding,
    this.borderRadius,
    this.borderRadiusGeometry,
    this.onTap,
    this.type = ContainerType.primary,
    this.shape,
    this.height,
    this.width,
    this.splashColor,
    this.containerColor,
    this.color,
  });

  Function()? _onTap() {
    switch (type) {
      case ContainerType.disabled:
        return null;
      default:
        return onTap;
    }
  }

  Color? _getBackgroundColor() {
    if (color != null) return color;
    if (containerColor != null) {
      if (type == ContainerType.label) return containerColor!.withValues(alpha: 0.12);
      return containerColor;
    }
    return type?.backgroundColor;
  }

  Color? _getBorderColor() {
    if (type == ContainerType.iconContainer && containerColor != null) return containerColor;
    if (type == ContainerType.label && containerColor != null) return containerColor!.withValues(alpha: 0.12);
    return type?.borderColor;
  }

  @override
  Widget build(BuildContext context) {
    EdgeInsets effectivePadding;

    if (padding != null) {
      effectivePadding = padding!;
    } else {
      effectivePadding = switch (type) {
        ContainerType.noContainer => EdgeInsets.zero,
        ContainerType.iconContainer => const EdgeInsets.all(8),
        ContainerType.label => const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        _ => const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      };
    }

    final effectiveBorderRadius = borderRadiusGeometry ?? (shape == BoxShape.circle ? BorderRadius.circular(1000) : BorderRadius.circular(borderRadius ?? appTokens.radius12));

    Widget container = Opacity(
      opacity: type == ContainerType.disabled ? 0.5 : 1,
      child: ClipRRect(
        borderRadius: effectiveBorderRadius,
        child: InkWell(
          customBorder: shape == BoxShape.circle ? const CircleBorder() : RoundedRectangleBorder(borderRadius: effectiveBorderRadius),
          splashColor: splashColor,
          onTap: _onTap(),
          child: Container(
            height: height,
            width: width,
            padding: effectivePadding,
            decoration: shape == null
                ? BoxDecoration(
                    color: _getBackgroundColor(),
                    borderRadius: effectiveBorderRadius,
                    border: Border.all(color: _getBorderColor() ?? appColors.overlayFaint),
                  )
                : BoxDecoration(
                    shape: shape!,
                    color: _getBackgroundColor(),
                    border: Border.all(color: _getBorderColor() ?? appColors.overlayFaint),
                  ),
            child: child,
          ),
        ),
      ),
    );

    if (blurSigma != null) {
      return ClipRRect(
        borderRadius: shape == BoxShape.circle ? BorderRadius.circular(100) : BorderRadius.circular(appTokens.radius12),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blurSigma!, sigmaY: blurSigma!),
          child: Container(
            padding: padding ?? EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: _getBackgroundColor(),
              borderRadius: BorderRadius.circular(appTokens.radius12),
              border: Border.all(color: _getBorderColor() ?? appColors.overlayFaint),
            ),
            child: child,
          ),
        ),
      );
    }

    return container;
  }
}
