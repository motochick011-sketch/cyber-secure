import 'package:cybersecure/design_system/theme/theme_access.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double max;
  final double current;
  final double? width;
  final double height;
  final Color? color;
  final Color? trackColor;

  const ProgressBar({super.key, required this.max, required this.current, this.width = double.infinity, this.height = 5, this.color, this.trackColor});

  double get _fraction {
    if (max <= 0 || current.isNaN || max.isNaN) return 0;
    return (current / max).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(appTokens.radius24),
      child: Container(
        width: width,
        height: height,
        color: trackColor ?? appColors.overlayMuted,
        child: Align(
          alignment: Alignment.centerLeft,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                width: constraints.maxWidth * _fraction,
                height: height,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(appTokens.radius24), color: color ?? appColors.primary),
              );
            },
          ),
        ),
      ),
    );
  }
}
