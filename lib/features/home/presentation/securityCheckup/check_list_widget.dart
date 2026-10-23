import 'package:cybersecure/design_system/widgets/buttons/app_text_button.dart';
import 'package:cybersecure/design_system/widgets/text/title_widget.dart';
import 'package:flutter/material.dart';

class CheckListWidget extends StatelessWidget {
  const CheckListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleWidget(title: "Choose status:"),
        SizedBox(height: 12),
        AppTextButton(onPressed: () {}, text: "Not Done"),
        SizedBox(height: 12),
        AppTextButton(onPressed: () {}, text: "Needs Attention"),
        SizedBox(height: 12),
        AppTextButton(onPressed: () {}, text: "Done"),
      ],
    );
  }
}
