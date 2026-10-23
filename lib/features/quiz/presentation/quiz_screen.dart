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
import 'package:cybersecure/features/quiz/domain/models/quiz.dart';
import 'package:cybersecure/features/quiz/quiz_cubit/quiz_cubit.dart';
import 'package:cybersecure/features/quiz/quiz_cubit/quiz_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  void initState() {
    super.initState();
    getIt.quiz.load();
  }

  void _openCategory(QuizCategory category) {
    getIt.quiz.selectCategory(category);
    getIt<NavigationCubit>().push(SubScreen.quizSelect);
  }

  List<Quiz> _quizzesIn(List<Quiz> all, QuizCategory category) {
    return all.where((q) => q.category == category).toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCubit, QuizState>(
      bloc: getIt.quiz,
      builder: (context, quizState) {
        final quizzes = quizState.data.quizzes;
        final isLoadingEmpty = quizState.status == Status.loading && quizzes.isEmpty;
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleWidget(title: "Quiz", subtitle: "Choose a topic and test your knowledge", size: TitleSize.large),
              SizedBox(height: appTokens.space24),
              _buildRecommended(quizzes),
              SizedBox(height: appTokens.space24),
              if (isLoadingEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: appTokens.space32),
                  child: Center(child: LoadingIndicator()),
                )
              else
                _buildTopicGrid(quizzes),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRecommended(List<Quiz> quizzes) {
    QuizCategory? recommended;
    for (final category in QuizCategory.values) {
      if (_quizzesIn(quizzes, category).isNotEmpty) {
        recommended = category;
        break;
      }
    }

    final category = recommended ?? QuizCategory.values.first;

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
                TitleWidget(title: "${category.displayName} Quiz", size: TitleSize.large, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          SizedBox(width: appTokens.space12),
          Icon(LucideIcons.arrowRight, color: appColors.primary),
        ],
      ),
    );
  }

  Widget _buildTopicGrid(List<Quiz> quizzes) {
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
              Expanded(child: _buildTopicCard(left, _quizzesIn(quizzes, left).length)),
              SizedBox(width: appTokens.space12),
              Expanded(child: right == null ? const SizedBox.shrink() : _buildTopicCard(right, _quizzesIn(quizzes, right).length)),
            ],
          ),
        ),
      );

      if (i + 2 < categories.length) rows.add(SizedBox(height: appTokens.space12));
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: rows);
  }

  Widget _buildTopicCard(QuizCategory category, int quizCount) {
    final countLabel = quizCount == 1 ? "1 quiz" : "$quizCount quizzes";

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
