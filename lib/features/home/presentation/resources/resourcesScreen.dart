import 'package:cybersecure/core/di/injector.dart';
import 'package:cybersecure/core/di/locators.dart';
import 'package:cybersecure/design_system/theme/app_text_styles.dart';
import 'package:cybersecure/design_system/theme/theme_access.dart';
import 'package:cybersecure/design_system/widgets/scaffolding/app_container.dart';
import 'package:cybersecure/design_system/widgets/scaffolding/app_scaffold.dart';
import 'package:cybersecure/design_system/widgets/text/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class _Resource {
  final String title;
  final String description;
  final String url;

  const _Resource({required this.title, required this.description, required this.url});
}

const List<_Resource> _resources = [
  _Resource(title: "Cybersecurity Glossary", description: "Understand common scams and security terms.", url: "https://www.yima.org.za/scamtypes"),
  _Resource(title: "What to do if hacked", description: "Steps to take if you've been scammed or compromised.", url: "https://www.yima.org.za/scampreventiontoolbox"),
  _Resource(title: "Security Tips", description: "Simple habits you can use every day.", url: "https://www.sabric.co.za/"),
  _Resource(title: "Report a Scam", description: "Report suspicious activity to SAFPS / Yima.", url: "https://www.yima.org.za/reportscam"),
];

class Resourcesscreen extends StatelessWidget {
  const Resourcesscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      showBack: true,
      title: "Resources",
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleWidget(title: "Resources", subtitle: "Helpful guides for staying safe online.", size: TitleSize.large),
            SizedBox(height: appTokens.space24),
            ..._resources.map(
              (resource) => Padding(
                padding: EdgeInsets.only(bottom: appTokens.space12),
                child: _resourceCard(resource),
              ),
            ),
            SizedBox(height: appTokens.space12),
            _dailyTip(),
          ],
        ),
      ),
    );
  }

  Widget _resourceCard(_Resource resource) {
    return AppContainer(
      width: double.infinity,
      padding: EdgeInsets.all(appTokens.space16),
      onTap: () => getIt.platform.openUrl(resource.url),
      child: Row(
        children: [
          AppContainer(
            type: ContainerType.iconContainer,
            child: Icon(LucideIcons.globe, color: appColors.primary, size: 18),
          ),
          SizedBox(width: appTokens.space12),
          Expanded(
            child: TitleWidget(title: resource.title, subtitle: resource.description, size: TitleSize.medium),
          ),
          SizedBox(width: appTokens.space8),
          Icon(LucideIcons.chevronRight, color: appColors.textSecondary, size: 20),
        ],
      ),
    );
  }

  Widget _dailyTip() {
    return AppContainer(
      type: ContainerType.accent,
      width: double.infinity,
      padding: EdgeInsets.all(appTokens.space24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(LucideIcons.lightbulb, color: appColors.secondary, size: 16),
              SizedBox(width: appTokens.space8),
              Text("Daily security tip", style: appStyles.caption.bold.copyWith(color: appColors.secondary)),
            ],
          ),
          SizedBox(height: appTokens.space12),
          Text("Think before you click.", style: appStyles.title.bold.copyWith(color: appColors.textPrimary)),
          SizedBox(height: appTokens.space8),
          Text("A few seconds of verification can prevent a major security problem or a financial loss.", style: appStyles.body.copyWith(color: appColors.textSecondary)),
        ],
      ),
    );
  }
}
