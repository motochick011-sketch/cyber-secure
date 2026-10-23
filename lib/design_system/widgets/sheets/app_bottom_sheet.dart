import 'package:flutter/material.dart';
import 'package:cybersecure/design_system/theme/theme_access.dart';
import 'package:cybersecure/design_system/widgets/sheets/trapezoid.dart';
import 'package:cybersecure/generated/assets.gen.dart';

class AppBottomSheet extends StatefulWidget {
  final Widget dialogChild;
  final Function? onTap;
  final bool disableChildOnTap;
  final bool disableOnTap;
  final Widget child;
  final Widget? title;
  final num? height;
  final bool displayAboveKeyboard;
  final Function? onDismissed;
  final bool showSplash;

  const AppBottomSheet({
    super.key,
    this.child = const SizedBox(),
    required this.dialogChild,
    this.onTap,
    this.title,
    this.height = 0.8,
    this.disableChildOnTap = false,
    this.displayAboveKeyboard = true,
    this.disableOnTap = false,
    this.onDismissed,
    this.showSplash = true,
  });

  @override
  State<AppBottomSheet> createState() => _AppBottomSheetState();

  void callOnDismissed() {
    Function? callback = onDismissed;
    if (callback != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        callback();
      });
    }
  }

  void showSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: false,
      clipBehavior: Clip.hardEdge,
      builder: (BuildContext context) {
        final double bottomPadding = MediaQuery.of(context).viewInsets.bottom;
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: EdgeInsets.only(bottom: displayAboveKeyboard ? bottomPadding : 0),
              child: Trapezoid(
                color: appColors.overlayFaint,
                child: Container(
                  height: MediaQuery.of(context).size.height * height!,
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 24, right: 24, bottom: 24),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ?title,
                          const Spacer(),
                          Assets.svg.cyberSecureLogo.svg(height: 30, colorFilter: ColorFilter.mode(appColors.overlayStrong, BlendMode.srcIn)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Expanded(child: dialogChild),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    ).then((value) {
      callOnDismissed();
    });
  }
}

class _AppBottomSheetState extends State<AppBottomSheet> {
  void _showSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: false,
      clipBehavior: Clip.hardEdge,
      builder: (BuildContext context) {
        final double bottomPadding = MediaQuery.of(context).viewInsets.bottom;
        return Padding(
          padding: EdgeInsets.only(bottom: widget.displayAboveKeyboard ? bottomPadding : 0),
          child: Trapezoid(
            color: appColors.overlayFaint,
            child: Container(
              height: MediaQuery.of(context).size.height * widget.height!,
              width: double.infinity,
              padding: EdgeInsets.only(left: 24, right: 24, bottom: 24),
              child: Column(
                children: [
                  Row(
                    children: [
                      if (widget.title != null) widget.title!,
                      const Spacer(),
                      Assets.svg.cyberSecureLogo.svg(height: 30, colorFilter: ColorFilter.mode(appColors.overlayStrong, BlendMode.srcIn)),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Expanded(child: widget.dialogChild),
                ],
              ),
            ),
          ),
        );
      },
    ).then((value) {
      widget.callOnDismissed();
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      enableFeedback: true,
      borderRadius: BorderRadius.circular(appTokens.radius12),
      splashColor: widget.showSplash ? Theme.of(context).primaryColor.withValues(alpha: 0.5) : Colors.transparent,
      highlightColor: widget.showSplash ? null : Colors.transparent,
      onTap: widget.disableOnTap
          ? null
          : () {
              widget.onTap?.call();
              if (!widget.disableChildOnTap) _showSheet(context);
            },
      child: widget.child,
    );
  }
}
