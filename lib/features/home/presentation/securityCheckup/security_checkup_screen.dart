import 'package:cybersecure/core/di/injector.dart';
import 'package:cybersecure/core/navigation/navigation_cubit/navigation_cubit.dart';
import 'package:cybersecure/core/navigation/screen_id.dart';
import 'package:cybersecure/design_system/theme/theme_access.dart';
import 'package:cybersecure/design_system/widgets/buttons/app_text_button.dart';
import 'package:cybersecure/design_system/widgets/scaffolding/app_container.dart';
import 'package:cybersecure/design_system/widgets/scaffolding/app_scaffold.dart';
import 'package:cybersecure/design_system/widgets/sheets/app_bottom_sheet.dart';
import 'package:cybersecure/design_system/widgets/text/title_widget.dart';
import 'package:cybersecure/features/home/presentation/securityCheckup/check_list_widget.dart';
import 'package:flutter/material.dart';

class SecurityCheckupScreen extends StatelessWidget {
  const SecurityCheckupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      showBack: true,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentGeometry.centerLeft,
              child: Text("Security Checkup", style: appStyles.title.copyWith(fontWeight: FontWeight.bold, fontSize: 30.0)),
            ),

            SizedBox(height: 10),
            Text("Find out how strong your everyday habits are."),
            SizedBox(height: 10),
            AppContainer(
              height: 150,
              width: double.infinity,
              color: Colors.grey[800],
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Align(
                    alignment: AlignmentGeometry.centerLeft,
                    child: Text("Your score", style: appStyles.body.copyWith(color: Colors.white)),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: AlignmentGeometry.centerLeft,
                    child: Text(
                      "72/100",
                      style: appStyles.title.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30.0),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
            Align(
              alignment: AlignmentGeometry.centerLeft,
              child: Text("Your checklist", style: appStyles.title.copyWith(fontWeight: FontWeight.bold, fontSize: 30.0)),
            ),

            SizedBox(height: 10),
            checklist(title: "Unique passwords"),
            SizedBox(height: 10),
            checklist(title: "Multi-Factor authentication"),
            SizedBox(height: 10),
            checklist(title: "Software updates"),
            SizedBox(height: 10),
            checklist(title: "Backup important files"),
            SizedBox(height: 10),
            checklist(title: "Verify suspicious links"),
            SizedBox(height: 20),
            AppTextButton(
              onPressed: () {
                getIt<NavigationCubit>().goTo(ScreenId.learn);
              },
              text: "Improve my score",
            ),
          ],
        ),
      ),
    );
  }

  Widget checklist({required String title}) {
    return AppBottomSheet(
      dialogChild: CheckListWidget(),
      height: 0.5,
      child: AppContainer(
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              SizedBox(width: 20),
              TitleWidget(title: title),
            ],
          ),
        ),
      ),
    );
  }
}
