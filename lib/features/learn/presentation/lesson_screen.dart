import 'package:cybersecure/core/cubit/view_state.dart';
import 'package:cybersecure/core/di/injector.dart';
import 'package:cybersecure/core/di/locators.dart';
import 'package:cybersecure/core/navigation/navigation_cubit/navigation_cubit.dart';
import 'package:cybersecure/core/navigation/screen_id.dart';
import 'package:cybersecure/core/navigation/sub_screen.dart';
import 'package:cybersecure/design_system/theme/theme_access.dart';
import 'package:cybersecure/design_system/widgets/buttons/app_text_button.dart';
import 'package:cybersecure/design_system/widgets/extra/progress_bar.dart';
import 'package:cybersecure/design_system/widgets/feedback/loading_indicator.dart';
import 'package:cybersecure/design_system/widgets/scaffolding/app_container.dart';
import 'package:cybersecure/design_system/widgets/scaffolding/app_scaffold.dart';
import 'package:cybersecure/design_system/widgets/text/title_widget.dart';
import 'package:cybersecure/features/learn/domain/models/callout_style.dart';
import 'package:cybersecure/features/learn/domain/models/lesson.dart';
import 'package:cybersecure/features/learn/domain/models/lesson_block.dart';
import 'package:cybersecure/features/learn/learn_cubit/learn_cubit.dart';
import 'package:cybersecure/features/learn/learn_cubit/learn_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonScreen extends StatelessWidget {
  const LessonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LearnCubit, LearnState>(
      bloc: getIt.learn,
      builder: (context, learnState) {
        var lesson = learnState.data.activeLesson;
        var cubit = getIt.learn;
        return AppScaffold(
          showBack: true,
          title: "Lesson ${getIt.learn.lessonNumber} of ${getIt.learn.totalInCategory}",
          child: Builder(
            builder: (context) {
              if (learnState.status == Status.loading || lesson == null) return LoadingIndicator();
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleWidget(title: lesson.title, subtitle: lesson.subtitle, size: TitleSize.large),
                    SizedBox(height: appTokens.space8),
                    ...lesson.blocks.map(
                      (b) => Padding(
                        padding: EdgeInsets.only(bottom: appTokens.space12),
                        child: _block(b),
                      ),
                    ),
                    Text("Lesson progress", style: appStyles.hint.copyWith(color: appColors.textSecondary)),
                    SizedBox(height: appTokens.space16),
                    ProgressBar(max: 100, current: (cubit.progress * 100).round().toDouble(), height: 12),
                    SizedBox(height: appTokens.space16),
                    _bottomButton(cubit, lesson),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _block(LessonBlock b) {
    switch (b) {
      case ParagraphBlock(:final text):
        return Align(
          alignment: Alignment.centerLeft,
          child: Text(text, style: appStyles.hint.copyWith(color: appColors.textPrimary)),
        );
      case BulletsBlock(:final heading, :final items):
        return AppContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (heading != null) TitleWidget(title: heading, size: TitleSize.large),
              SizedBox(height: appTokens.space8),
              ...items.map((i) => Text("\u2022 $i", style: appStyles.hint)),
            ],
          ),
        );
      case StepsBlock(:final heading, :final steps):
        return AppContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (heading != null) TitleWidget(title: heading, size: TitleSize.large),
              SizedBox(height: appTokens.space8),
              ...steps.expand(
                (s) => [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      s.title,
                      style: appStyles.body.copyWith(color: appColors.textPrimary, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(s.text, style: appStyles.hint),
                ],
              ),
            ],
          ),
        );
      case CalloutBlock(:final heading, :final text, :final style):
        return AppContainer(
          color: _calloutColor(style),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (heading != null) Text(heading, style: appStyles.title.copyWith(fontWeight: FontWeight.bold)),
              SizedBox(height: appTokens.space8),
              Text(text, style: appStyles.hint),
            ],
          ),
        );
      case CompareBlock(:final leftLabel, :final leftValue, :final rightLabel, :final rightValue):
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(leftLabel, style: appStyles.hint),
                SizedBox(height: appTokens.space4),
                AppContainer(
                  color: appColors.error.withValues(alpha: 0.2),
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: Text(leftValue, style: appStyles.hint)),
                      Icon(Icons.cancel, color: appColors.error),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(width: appTokens.space16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(rightLabel, style: appStyles.hint),
                SizedBox(height: appTokens.space4),
                AppContainer(
                  color: appColors.selected.withValues(alpha: 0.2),
                  width: 170,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: Text(rightValue, style: appStyles.hint)),
                      Icon(Icons.check_circle, color: appColors.selected),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
    }
  }

  Color? _calloutColor(CalloutStyle style) {
    switch (style) {
      case CalloutStyle.neutral:
        return null;
      case CalloutStyle.secondary:
        return appColors.secondary.withValues(alpha: 0.1);
      case CalloutStyle.success:
        return appColors.success.withValues(alpha: 0.1);
      case CalloutStyle.warning:
        return appColors.warning.withValues(alpha: 0.2);
    }
  }

  Widget _bottomButton(LearnCubit cubit, Lesson lesson) {
    if (!cubit.isLastLesson) {
      return Column(
        children: [
          AppTextButton(text: "Next", onPressed: () => getIt.learn.next()),
          SizedBox(height: appTokens.space8),
          AppTextButton(isSecondary: true, text: "Back", onPressed: () => getIt.learn.previous()),
        ],
      );
    }
    return AppTextButton(
      text: "Take the ${lesson.category.displayName} quiz",
      onPressed: () {
        getIt.quiz.selectCategory(lesson.category);
        getIt<NavigationCubit>().goTo(ScreenId.quiz);
        getIt<NavigationCubit>().push(SubScreen.quizSelect);
      },
    );
  }
}
