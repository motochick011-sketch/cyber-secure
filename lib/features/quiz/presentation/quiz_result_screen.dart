import 'package:cybersecure/core/di/injector.dart';
import 'package:cybersecure/core/di/locators.dart';
import 'package:cybersecure/core/navigation/navigation_cubit/navigation_cubit.dart';
import 'package:cybersecure/core/navigation/screen_id.dart';
import 'package:cybersecure/design_system/theme/app_text_styles.dart';
import 'package:cybersecure/design_system/theme/theme_access.dart';
import 'package:cybersecure/design_system/widgets/buttons/app_text_button.dart';
import 'package:cybersecure/design_system/widgets/scaffolding/app_container.dart';
import 'package:cybersecure/design_system/widgets/scaffolding/app_scaffold.dart';
import 'package:cybersecure/design_system/widgets/text/title_widget.dart';
import 'package:cybersecure/features/quiz/domain/models/quiz_question.dart';
import 'package:cybersecure/features/quiz/quiz_cubit/quiz_cubit.dart';
import 'package:cybersecure/features/quiz/quiz_cubit/quiz_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: BlocBuilder<QuizCubit, QuizState>(
        bloc: getIt.quiz,
        builder: (context, state) {
          final cubit = getIt.quiz;
          final quiz = cubit.activeQuiz;
          final result = state.data.result;
          if (quiz == null || result == null) {
            return const SizedBox.shrink();
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleWidget(title: quiz.title, size: TitleSize.large),
                SizedBox(height: appTokens.space8),
                Text("You got ${result.score} of ${result.total}", style: appStyles.title),
                SizedBox(height: appTokens.space4),
                Text(result.passed ? "Passed" : "Failed", style: appStyles.body.copyWith(color: result.passed ? appColors.success : appColors.error)),
                SizedBox(height: appTokens.space24),
                ...List.generate(quiz.questions.length, (index) {
                  final question = quiz.questions[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: appTokens.space16),
                    child: questionResult(cubit, question, index + 1),
                  );
                }),
                SizedBox(height: appTokens.space8),
                AppTextButton(text: "Close", onPressed: () => getIt<NavigationCubit>().goTo(ScreenId.quiz)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget questionResult(QuizCubit cubit, QuizQuestion question, int number) {
    final correct = cubit.wasCorrect(question.id);
    final chosenId = cubit.selectedAnswerFor(question.id);
    final chosen = chosenId == null ? null : question.answers.where((a) => a.id == chosenId).toList();
    final chosenText = (chosen == null || chosen.isEmpty) ? "No answer" : chosen.first.text;
    final correctAnswer = question.answers.where((a) => a.id == question.correctAnswerId).toList();
    final correctText = correctAnswer.isEmpty ? "" : correctAnswer.first.text;

    return AppContainer(
      width: double.infinity,
      color: correct ? appColors.success.withValues(alpha: 0.1) : appColors.error.withValues(alpha: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(correct ? LucideIcons.check : LucideIcons.x, color: correct ? appColors.success : appColors.error, size: 18),
              SizedBox(width: appTokens.space8),
              Expanded(
                child: Text("Question $number: ${question.text}", style: appStyles.body.bold.copyWith(color: appColors.textPrimary)),
              ),
            ],
          ),
          SizedBox(height: appTokens.space8),
          Text("Your answer: $chosenText", style: appStyles.hint.copyWith(color: appColors.textPrimary)),
          if (!correct) ...[SizedBox(height: appTokens.space8), Text("Correct answer is: $correctText", style: appStyles.hint.copyWith(color: appColors.textPrimary))],
        ],
      ),
    );
  }
}
