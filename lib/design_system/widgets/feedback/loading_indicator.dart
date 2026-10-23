import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cybersecure/design_system/theme/theme_access.dart';

class LoadingIndicator extends StatefulWidget {
  const LoadingIndicator({super.key});

  @override
  State<LoadingIndicator> createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator> {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator.adaptive(backgroundColor: Platform.isIOS ? appColors.primary : Colors.transparent);
  }
}
