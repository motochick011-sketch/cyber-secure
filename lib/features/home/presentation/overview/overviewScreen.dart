import 'package:cybersecure/core/cubit/view_state.dart';
import 'package:cybersecure/core/di/injector.dart';
import 'package:cybersecure/core/di/locators.dart';
import 'package:cybersecure/design_system/theme/app_text_styles.dart';
import 'package:cybersecure/design_system/theme/theme_access.dart';
import 'package:cybersecure/design_system/widgets/extra/progress_bar.dart';
import 'package:cybersecure/design_system/widgets/feedback/loading_indicator.dart';
import 'package:cybersecure/design_system/widgets/scaffolding/app_container.dart';
import 'package:cybersecure/design_system/widgets/scaffolding/app_scaffold.dart';
import 'package:cybersecure/design_system/widgets/text/title_widget.dart';
import 'package:cybersecure/features/profile/domains/models/user_learning_status.dart';
import 'package:cybersecure/features/profile/profile_cubit/profile_cubit.dart';
import 'package:cybersecure/features/profile/profile_cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class Overviewscreen extends StatelessWidget {
  const Overviewscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      showBack: true,
      title: "Overview",
      child: BlocBuilder<ProfileCubit, ProfileState>(
        bloc: getIt.profile,
        builder: (context, profileState) {
          final UserLearningStatus? learningStatus = profileState.data.learningStatus;

          // Still loading the journey and nothing to show yet.
          if (profileState.status == Status.loading && learningStatus == null) {
            return const Center(child: LoadingIndicator());
          }

          // Aggregate totals (not per-category) guarded against nulls.
          final int lessonsCompleted = learningStatus?.lessonsCompleted ?? 0;
          final int totalLessons = learningStatus?.totalLessons ?? 0;
          final int quizzesCompleted = learningStatus?.quizzesCompleted ?? 0;
          final int quizzesPassed = learningStatus?.quizzesPassed ?? 0;
          final int totalQuizzes = learningStatus?.totalQuizzes ?? 0;

          final int lessonsRemaining = (totalLessons - lessonsCompleted).clamp(0, totalLessons);
          final int quizzesRemaining = (totalQuizzes - quizzesPassed).clamp(0, totalQuizzes);

          final int achievementsEarned = profileState.data.achievements.length;

          // Reuse the Profile combined-progress formula verbatim so the
          // percentage agrees with the Profile and Home screens.
          final int combinedCompleted = lessonsCompleted + quizzesCompleted;
          final int combinedTotal = totalLessons + totalQuizzes;
          final int percent = (combinedTotal == 0 ? 0 : ((combinedCompleted / combinedTotal) * 100).clamp(0, 100)).round();

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleWidget(title: "Your progress", subtitle: "A detailed look at your learning journey", size: TitleSize.large),
                SizedBox(height: appTokens.space24),
                _heroCard(percent: percent, combinedCompleted: combinedCompleted, combinedTotal: combinedTotal),
                SizedBox(height: appTokens.space24),
                TitleWidget(title: "Detailed breakdown", size: TitleSize.large),
                SizedBox(height: appTokens.space16),
                _breakdownRow(
                  icon: LucideIcons.bookOpen,
                  label: "Lessons completed",
                  value: "$lessonsCompleted of $totalLessons",
                  progressCurrent: lessonsCompleted.toDouble(),
                  progressMax: totalLessons.toDouble(),
                  isComplete: totalLessons > 0 && lessonsCompleted >= totalLessons,
                ),
                SizedBox(height: appTokens.space12),
                _breakdownRow(
                  icon: LucideIcons.listChecks,
                  label: "Quizzes completed",
                  value: "$quizzesCompleted of $totalQuizzes",
                  progressCurrent: quizzesCompleted.toDouble(),
                  progressMax: totalQuizzes.toDouble(),
                  isComplete: totalQuizzes > 0 && quizzesCompleted >= totalQuizzes,
                ),
                SizedBox(height: appTokens.space12),
                _breakdownRow(
                  icon: LucideIcons.shieldCheck,
                  label: "Quizzes passed",
                  value: "$quizzesPassed of $totalQuizzes",
                  progressCurrent: quizzesPassed.toDouble(),
                  progressMax: totalQuizzes.toDouble(),
                  isComplete: totalQuizzes > 0 && quizzesPassed >= totalQuizzes,
                ),
                SizedBox(height: appTokens.space12),
                _breakdownRow(icon: LucideIcons.target, label: "Lessons remaining", value: "$lessonsRemaining", isComplete: totalLessons > 0 && lessonsRemaining == 0),
                SizedBox(height: appTokens.space12),
                _breakdownRow(icon: LucideIcons.graduationCap, label: "Quizzes remaining", value: "$quizzesRemaining", isComplete: totalQuizzes > 0 && quizzesRemaining == 0),
                SizedBox(height: appTokens.space12),
                _breakdownRow(icon: LucideIcons.trophy, label: "Achievements earned", value: "$achievementsEarned", isComplete: achievementsEarned > 0),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _heroCard({required int percent, required int combinedCompleted, required int combinedTotal}) {
    return AppContainer(
      type: ContainerType.accent,
      width: double.infinity,
      padding: EdgeInsets.all(appTokens.space24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleWidget(title: "Overall progress", size: TitleSize.small, titleColor: appColors.textSecondary),
          SizedBox(height: appTokens.space8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("$percent%", style: appStyles.display.bold.copyWith(color: appColors.success)),
              SizedBox(width: appTokens.space8),
              Padding(
                padding: EdgeInsets.only(bottom: appTokens.space8),
                child: Text("complete", style: appStyles.body.copyWith(color: appColors.textSecondary)),
              ),
            ],
          ),
          SizedBox(height: appTokens.space16),
          ProgressBar(max: combinedTotal.toDouble(), current: combinedCompleted.toDouble(), color: appColors.success, height: 10),
          SizedBox(height: appTokens.space12),
          Text("$combinedCompleted of $combinedTotal activities finished", style: appStyles.caption.copyWith(color: appColors.textSecondary)),
        ],
      ),
    );
  }

  Widget _breakdownRow({required IconData icon, required String label, required String value, bool isComplete = false, double? progressCurrent, double? progressMax}) {
    final bool showProgress = progressCurrent != null && progressMax != null;
    return AppContainer(
      width: double.infinity,
      padding: EdgeInsets.all(appTokens.space16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppContainer(
                type: ContainerType.iconContainer,
                child: Icon(icon, color: appColors.primary, size: 18),
              ),
              SizedBox(width: appTokens.space12),
              Expanded(
                child: TitleWidget(title: label, size: TitleSize.medium),
              ),
              SizedBox(width: appTokens.space8),
              Text(value, style: appStyles.subtitle.bold.copyWith(color: appColors.textPrimary)),
              if (isComplete) ...[SizedBox(width: appTokens.space8), Icon(LucideIcons.check, color: appColors.success, size: 18)],
            ],
          ),
          if (showProgress) ...[SizedBox(height: appTokens.space12), ProgressBar(max: progressMax, current: progressCurrent, color: isComplete ? appColors.success : appColors.primary)],
        ],
      ),
    );
  }
}
