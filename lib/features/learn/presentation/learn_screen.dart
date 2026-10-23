import 'package:cybersecure/core/cubit/view_state.dart';
import 'package:cybersecure/core/di/injector.dart';
import 'package:cybersecure/core/di/locators.dart';
import 'package:cybersecure/core/domain/category.dart';
import 'package:cybersecure/core/navigation/navigation_cubit/navigation_cubit.dart';
import 'package:cybersecure/core/navigation/sub_screen.dart';
import 'package:cybersecure/design_system/category_presentation.dart';
import 'package:cybersecure/design_system/theme/theme_access.dart';
import 'package:cybersecure/design_system/widgets/feedback/loading_indicator.dart';
import 'package:cybersecure/design_system/widgets/scaffolding/app_container.dart';
import 'package:cybersecure/design_system/widgets/text/title_widget.dart';
import 'package:cybersecure/features/learn/domain/models/lesson.dart';
import 'package:cybersecure/features/learn/learn_cubit/learn_cubit.dart';
import 'package:cybersecure/features/learn/learn_cubit/learn_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class LearnScreen extends StatefulWidget {
  const LearnScreen({super.key});

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  @override
  void initState() {
    super.initState();
    getIt.learn.load();
  }

  void _openCategory(QuizCategory category) {
    getIt.learn.startCategory(category);
    getIt<NavigationCubit>().push(SubScreen.lesson);
  }

  List<Lesson> _lessonsIn(List<Lesson> all, QuizCategory category) {
    return all.where((l) => l.category == category).toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LearnCubit, LearnState>(
      bloc: getIt.learn,
      builder: (context, learnState) {
        final lessons = learnState.data.lessons;
        final isLoadingEmpty = learnState.status == Status.loading && lessons.isEmpty;
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleWidget(title: "Learn Cybersecurity", subtitle: "Choose a topic and learn at your own pace", size: TitleSize.large),
              SizedBox(height: appTokens.space24),
              _buildRecommended(lessons),
              SizedBox(height: appTokens.space24),
              if (isLoadingEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: appTokens.space32),
                  child: Center(child: LoadingIndicator()),
                )
              else
                _buildTopicGrid(lessons),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRecommended(List<Lesson> lessons) {
    QuizCategory? recommended;
    Lesson? firstLesson;
    for (final category in QuizCategory.values) {
      final inCategory = _lessonsIn(lessons, category)..sort((a, b) => a.order.compareTo(b.order));
      if (inCategory.isNotEmpty) {
        recommended = category;
        firstLesson = inCategory.first;
        break;
      }
    }

    final category = recommended ?? QuizCategory.values.first;
    final title = firstLesson?.title ?? "${category.displayName} Basics";

    return AppContainer(
      type: ContainerType.accent,
      padding: EdgeInsets.all(appTokens.space16),
      onTap: () => _openCategory(category),
      child: Row(
        children: [
          AppContainer(
            type: ContainerType.iconContainer,
            child: Icon(category.icon, color: appColors.primary),
          ),
          SizedBox(width: appTokens.space16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Recommended for you", style: appStyles.caption.copyWith(color: appColors.secondary)),
                SizedBox(height: appTokens.space4),
                TitleWidget(title: title, size: TitleSize.large, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          SizedBox(width: appTokens.space12),
          Icon(LucideIcons.arrowRight, color: appColors.primary),
        ],
      ),
    );
  }

  Widget _buildTopicGrid(List<Lesson> lessons) {
    final categories = QuizCategory.values;
    final rows = <Widget>[];

    for (var i = 0; i < categories.length; i += 2) {
      final left = categories[i];
      final right = (i + 1 < categories.length) ? categories[i + 1] : null;

      rows.add(
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: _buildTopicCard(left, _lessonsIn(lessons, left).length)),
              SizedBox(width: appTokens.space12),
              Expanded(child: right == null ? const SizedBox.shrink() : _buildTopicCard(right, _lessonsIn(lessons, right).length)),
            ],
          ),
        ),
      );

      if (i + 2 < categories.length) rows.add(SizedBox(height: appTokens.space12));
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: rows);
  }

  Widget _buildTopicCard(QuizCategory category, int lessonCount) {
    final countLabel = lessonCount == 1 ? "1 lesson" : "$lessonCount lessons";

    return AppContainer(
      padding: EdgeInsets.all(appTokens.space16),
      onTap: () => _openCategory(category),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppContainer(
            type: ContainerType.iconContainer,
            child: Icon(category.icon, color: appColors.primary),
          ),
          SizedBox(height: appTokens.space12),
          TitleWidget(title: category.displayName, subtitle: category.blurb, size: TitleSize.medium),
          SizedBox(height: appTokens.space12),
          AppContainer(
            type: ContainerType.label,
            containerColor: appColors.primary,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(LucideIcons.bookOpen, color: appColors.primary, size: 14),
                SizedBox(width: appTokens.space4),
                Text(countLabel, style: appStyles.caption.copyWith(color: appColors.primary)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
