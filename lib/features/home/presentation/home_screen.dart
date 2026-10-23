import 'package:cybersecure/core/cubit/view_state.dart';
import 'package:cybersecure/core/navigation/screen_id.dart';
import 'package:cybersecure/design_system/widgets/buttons/app_text_button.dart';
import 'package:cybersecure/design_system/widgets/extra/progress_bar.dart';
import 'package:cybersecure/design_system/widgets/scaffolding/app_container.dart';
import 'package:cybersecure/design_system/widgets/text/title_widget.dart';
import 'package:cybersecure/features/profile/profile_cubit/profile_cubit.dart';
import 'package:cybersecure/features/profile/profile_cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/di/injector.dart';
import '../../../core/di/locators.dart';
import '../../../core/navigation/navigation_cubit/navigation_cubit.dart';
import '../../../core/navigation/sub_screen.dart';
import '../../../design_system/theme/app_text_styles.dart';
import '../../../design_system/theme/theme_access.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();

    if (getIt.profile.state.data.learningStatus == null && getIt.profile.state.status != Status.loading) {
      getIt.profile.load();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: appTokens.space8),
          _buildHero(),
          SizedBox(height: appTokens.space24),
          TitleWidget(title: "Your security journey", size: TitleSize.large),
          SizedBox(height: appTokens.space16),
          BlocBuilder<ProfileCubit, ProfileState>(bloc: getIt.profile, builder: (context, state) => _buildJourneyCard(state)),
          SizedBox(height: appTokens.space24),
          TitleWidget(title: "Featured topics", size: TitleSize.large),
          SizedBox(height: appTokens.space16),
          _featuredTopic(icon: LucideIcons.shieldCheck, title: "Security Checkup", subtitle: "Find out how strong your everyday habits are.", screen: SubScreen.securityCheckupScreen),
          SizedBox(height: appTokens.space12),
          _featuredTopic(icon: LucideIcons.chartColumn, title: "Overview", subtitle: "How far are you in your learning.", screen: SubScreen.overviewScreen),
          SizedBox(height: appTokens.space12),
          _featuredTopic(icon: LucideIcons.bookOpen, title: "Resources", subtitle: "Helpful guides for staying safe online.", screen: SubScreen.resourcesScreen),
        ],
      ),
    );
  }

  Widget _buildHero() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(appTokens.space24),
      decoration: BoxDecoration(gradient: appColors.primaryGradient, borderRadius: BorderRadius.circular(appTokens.radius12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("CyberSecure", style: appStyles.display.bold.copyWith(color: appColors.onPrimary)),
          SizedBox(height: appTokens.space8),
          Text("Learn. Practice. Stay Safe", style: appStyles.subtitle.copyWith(color: appColors.onPrimary)),
          SizedBox(height: appTokens.space16),
          AppTextButton(
            onPressed: () {
              getIt<NavigationCubit>().goTo(ScreenId.learn);
            },
            text: "Start Learning →",
          ),
        ],
      ),
    );
  }

  Widget _buildJourneyCard(ProfileState state) {
    final learningStatus = state.data.learningStatus;
    final num lessonsCompleted = learningStatus?.lessonsCompleted ?? 0;
    final num totalLessons = learningStatus?.totalLessons ?? 0;
    final num quizzesCompleted = learningStatus?.quizzesCompleted ?? 0;
    final num totalQuizzes = learningStatus?.totalQuizzes ?? 0;

    final num combinedCompleted = lessonsCompleted + quizzesCompleted;
    final num combinedTotal = totalLessons + totalQuizzes;
    final int combinedPercent = (combinedTotal == 0 ? 0 : ((combinedCompleted / combinedTotal) * 100).clamp(0, 100)).round();

    return AppContainer(
      width: double.infinity,
      padding: EdgeInsets.all(appTokens.space16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TitleWidget(title: "Progress", size: TitleSize.small, titleColor: appColors.textSecondary),
              Text("$combinedPercent%", style: appStyles.title.bold.copyWith(color: appColors.success)),
            ],
          ),
          SizedBox(height: appTokens.space12),
          ProgressBar(max: combinedTotal.toDouble(), current: combinedCompleted.toDouble(), color: appColors.success, height: 12),
          SizedBox(height: appTokens.space8),
          Text("$combinedCompleted / $combinedTotal completed", style: appStyles.caption.copyWith(color: appColors.textSecondary)),
        ],
      ),
    );
  }

  Widget _featuredTopic({required IconData icon, required String title, required String subtitle, required SubScreen screen}) {
    return AppContainer(
      width: double.infinity,
      onTap: () {
        getIt<NavigationCubit>().push(screen);
      },
      child: Row(
        children: [
          Icon(icon, color: appColors.primary),
          SizedBox(width: appTokens.space16),
          Expanded(
            child: TitleWidget(title: title, subtitle: subtitle),
          ),
        ],
      ),
    );
  }
}
