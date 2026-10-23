import 'package:cybersecure/core/cubit/view_state.dart';
import 'package:cybersecure/core/di/injector.dart';
import 'package:cybersecure/core/di/locators.dart';
import 'package:cybersecure/core/session/session_cubit/session_cubit.dart';
import 'package:cybersecure/core/session/session_cubit/session_state.dart';
import 'package:cybersecure/design_system/theme/app_text_styles.dart';
import 'package:cybersecure/design_system/theme/theme_access.dart';
import 'package:cybersecure/design_system/widgets/extra/progress_bar.dart';
import 'package:cybersecure/design_system/widgets/extra/round_image.dart';
import 'package:cybersecure/design_system/widgets/feedback/loading_indicator.dart';
import 'package:cybersecure/design_system/widgets/scaffolding/app_container.dart';
import 'package:cybersecure/design_system/widgets/text/title_widget.dart';
import 'package:cybersecure/features/auth/domain/models/user.dart';
import 'package:cybersecure/features/profile/domains/models/user_achievement.dart';
import 'package:cybersecure/features/profile/domains/models/user_learning_status.dart';
import 'package:cybersecure/features/profile/profile_cubit/profile_cubit.dart';
import 'package:cybersecure/features/profile/profile_cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isEditing = false;
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (getIt.profile.state.data.learningStatus == null && getIt.profile.state.status != Status.loading) {
      getIt.profile.load();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionCubit, SessionState>(
      bloc: getIt.session,
      builder: (context, sessionState) {
        User? user = sessionState.data.user;
        return BlocBuilder<ProfileCubit, ProfileState>(
          bloc: getIt.profile,
          builder: (context, profileState) {
            UserLearningStatus? learningStatus = profileState.data.learningStatus;
            num lessonsCompleted = learningStatus?.lessonsCompleted ?? 0;
            num totalLessons = learningStatus?.totalLessons ?? 0;
            num quizzesCompleted = learningStatus?.quizzesCompleted ?? 0;
            num quizzesPassed = learningStatus?.quizzesPassed ?? 0;
            num totalQuizzes = learningStatus?.totalQuizzes ?? 0;
            num quizzesRemaining = totalQuizzes - quizzesPassed;
            num lessonsRemaining = totalLessons - lessonsCompleted;
            List<UserAchievement> achievements = profileState.data.achievements;

            num combinedCompleted = lessonsCompleted + quizzesCompleted;
            num combinedTotal = totalLessons + totalQuizzes;
            int combinedPercent = (combinedTotal == 0 ? 0 : ((combinedCompleted / combinedTotal) * 100).clamp(0, 100)).round();

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleWidget(title: "My Profile", subtitle: "Track your learning journey", size: TitleSize.extraLarge),
                  SizedBox(height: appTokens.space24),
                  _buildIdentityCard(user),
                  SizedBox(height: appTokens.space16),
                  _buildHeroCard(
                    percent: combinedPercent,
                    current: combinedCompleted.toDouble(),
                    max: combinedTotal.toDouble(),
                    lessonsCompleted: lessonsCompleted,
                    totalLessons: totalLessons,
                    quizzesCompleted: quizzesCompleted,
                    totalQuizzes: totalQuizzes,
                  ),
                  SizedBox(height: appTokens.space24),
                  TitleWidget(title: "Achievements", size: TitleSize.large),
                  SizedBox(height: appTokens.space16),
                  _buildAchievements(profileState.status, achievements),
                  SizedBox(height: appTokens.space24),
                  TitleWidget(title: "Learning Activity", size: TitleSize.large),
                  SizedBox(height: appTokens.space16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _StatCard(
                          label: "Lessons",
                          icon: LucideIcons.bookOpen,
                          completed: lessonsCompleted,
                          total: totalLessons,
                          remaining: lessonsRemaining,
                          progressCurrent: lessonsCompleted.toDouble(),
                          progressMax: totalLessons.toDouble(),
                        ),
                      ),
                      SizedBox(width: appTokens.space12),
                      Expanded(
                        child: _StatCard(
                          label: "Quizzes",
                          icon: LucideIcons.listChecks,
                          completed: quizzesPassed,
                          total: totalQuizzes,
                          remaining: quizzesRemaining,
                          progressCurrent: quizzesPassed.toDouble(),
                          progressMax: totalQuizzes.toDouble(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildIdentityCard(User? user) {
    final String? avatarInitial = (user?.name.isNotEmpty ?? false) ? user!.name[0] : null;
    return AppContainer(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RoundImage(symbol: avatarInitial, size: 56),
          SizedBox(width: appTokens.space16),
          Expanded(
            child: _isEditing
                ? TextField(
                    controller: _nameController,
                    autofocus: true,
                    decoration: const InputDecoration(labelText: 'Name', isDense: true, filled: true),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleWidget(title: user?.name ?? "User", size: TitleSize.large),
                      SizedBox(height: appTokens.space8),
                      AppContainer(
                        type: ContainerType.label,
                        containerColor: user?.level?.color ?? UserLevel.beginner.color,
                        child: TitleWidget(title: user?.level?.displayName ?? UserLevel.beginner.displayName, size: TitleSize.small, titleColor: user?.level?.color ?? UserLevel.beginner.color),
                      ),
                    ],
                  ),
          ),
          if (_isEditing) ...[
            IconButton(
              icon: Icon(Icons.close, color: appColors.error),
              onPressed: () => setState(() => _isEditing = false),
            ),
            IconButton(
              icon: Icon(Icons.check, color: appColors.success),
              onPressed: () {
                final trimmed = _nameController.text.trim();
                if (trimmed.isEmpty) return;
                getIt<ProfileCubit>().updateName(trimmed);
                setState(() => _isEditing = false);
              },
            ),
          ] else
            IconButton(
              icon: Icon(Icons.edit_outlined),
              onPressed: () => setState(() {
                _isEditing = true;
                _nameController.text = user?.name ?? '';
              }),
            ),
        ],
      ),
    );
  }

  Widget _buildHeroCard({
    required int percent,
    required double current,
    required double max,
    required num lessonsCompleted,
    required num totalLessons,
    required num quizzesCompleted,
    required num totalQuizzes,
  }) {
    return AppContainer(
      type: ContainerType.accent,
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
          ProgressBar(max: max, current: current, color: appColors.success, height: 10),
          SizedBox(height: appTokens.space16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("$lessonsCompleted / $totalLessons lessons", style: appStyles.caption.copyWith(color: appColors.textSecondary)),
              Text("$quizzesCompleted / $totalQuizzes quizzes", style: appStyles.caption.copyWith(color: appColors.textSecondary)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAchievements(Status status, List<UserAchievement> achievements) {
    if (status == Status.loading) {
      return SizedBox(height: 120, child: LoadingIndicator());
    }
    if (achievements.isEmpty) {
      return AppContainer(
        type: ContainerType.borderOnly,
        padding: EdgeInsets.all(appTokens.space24),
        child: Row(
          children: [
            Icon(LucideIcons.award, color: appColors.primary),
            SizedBox(width: appTokens.space12),
            Expanded(
              child: TitleWidget(title: "No achievements yet", subtitle: "Keep learning to earn your first badge!", size: TitleSize.small),
            ),
          ],
        ),
      );
    }
    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: achievements.length,
        separatorBuilder: (_, __) => SizedBox(width: appTokens.space12),
        itemBuilder: (context, index) => _achievementTile(achievements[index]),
      ),
    );
  }

  Widget _achievementTile(UserAchievement achievement) {
    return AppContainer(
      width: 120,
      padding: EdgeInsets.all(appTokens.space16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(AchievementIcon.fromString(achievement.image).iconData, color: appColors.primary),
          SizedBox(height: appTokens.space8),
          TitleWidget(title: achievement.title, size: TitleSize.small, align: CrossAxisAlignment.center, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final num completed;
  final num total;
  final num remaining;
  final double progressCurrent;
  final double progressMax;

  const _StatCard({required this.label, required this.icon, required this.completed, required this.total, required this.remaining, required this.progressCurrent, required this.progressMax});

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      padding: EdgeInsets.all(appTokens.space16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: appColors.primary, size: 18),
              SizedBox(width: appTokens.space8),
              TitleWidget(title: label, size: TitleSize.small),
            ],
          ),
          SizedBox(height: appTokens.space12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("$completed", style: appStyles.heading.bold.copyWith(color: appColors.textPrimary)),
              Padding(
                padding: EdgeInsets.only(bottom: appTokens.space4),
                child: Text(" / $total", style: appStyles.caption.copyWith(color: appColors.textSecondary)),
              ),
            ],
          ),
          SizedBox(height: appTokens.space8),
          ProgressBar(max: progressMax, current: progressCurrent),
          SizedBox(height: appTokens.space8),
          Text("$remaining remaining", style: appStyles.caption.copyWith(color: appColors.textSecondary)),
        ],
      ),
    );
  }
}
