import 'package:cybersecure/core/di/injector.dart';
import 'package:cybersecure/core/di/locators.dart';
import 'package:cybersecure/core/navigation/navigation_cubit/navigation_cubit.dart';
import 'package:cybersecure/core/navigation/sub_screen.dart';
import 'package:cybersecure/design_system/theme/theme_access.dart';
import 'package:cybersecure/design_system/widgets/buttons/app_text_button.dart';
import 'package:cybersecure/design_system/widgets/extra/progress_bar.dart';
import 'package:cybersecure/design_system/widgets/scaffolding/app_container.dart';
import 'package:cybersecure/design_system/widgets/scaffolding/app_scaffold.dart';
import 'package:cybersecure/design_system/widgets/text/title_widget.dart';
import 'package:cybersecure/features/quiz/domain/models/quiz_answer.dart';
import 'package:cybersecure/features/quiz/quiz_cubit/quiz_cubit.dart';
import 'package:cybersecure/features/quiz/quiz_cubit/quiz_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizQuestionsScreen extends StatelessWidget {
  const QuizQuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      showBack: true,
      child: BlocBuilder<QuizCubit, QuizState>(
        bloc: getIt.quiz,
        builder: (context, state) {
          final cubit = getIt.quiz;
          final quiz = cubit.activeQuiz;
          final question = cubit.currentQuestion;
          if (quiz == null || question == null) {
            return const SizedBox.shrink();
          }

          final total = quiz.questions.length;
          final current = state.data.currentIndex;
          final selected = cubit.selectedAnswerFor(question.id);
          final answered = cubit.hasAnsweredCurrent;
          final isLast = cubit.isLastQuestion;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleWidget(title: quiz.title, size: TitleSize.large),
                SizedBox(height: appTokens.space8),
                ProgressBar(max: total.toDouble(), current: (current + 1).toDouble(), height: 12),
                SizedBox(height: appTokens.space24),
                Text("Question ${current + 1} of $total", style: appStyles.hint.copyWith(color: appColors.textSecondary)),
                SizedBox(height: appTokens.space8),
                Text(question.text, style: appStyles.title),
                SizedBox(height: appTokens.space24),
                ...List.generate(question.answers.length, (index) {
                  final answer = question.answers[index];
                  final letter = String.fromCharCode(65 + index);
                  return Padding(
                    padding: EdgeInsets.only(bottom: appTokens.space16),
                    child: answerTile(letter: letter, answer: answer, isSelected: selected == answer.id, onTap: () => getIt.quiz.selectAnswer(question.id, answer.id)),
                  );
                }),
                SizedBox(height: appTokens.space8),
                AppTextButton(
                  text: isLast ? "Submit" : "Next",
                  isDisabled: !answered,
                  onPressed: () async {
                    if (!answered) return;
                    if (isLast) {
                      await getIt.quiz.submit();
                      getIt<NavigationCubit>().push(SubScreen.quizResult);
                    } else {
                      getIt.quiz.next();
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget answerTile({required String letter, required QuizAnswer answer, required bool isSelected, required void Function() onTap}) {
    return AppContainer(
      width: double.infinity,
      color: isSelected ? appColors.primary : null,
      onTap: onTap,
      child: Text(
        "$letter. ${answer.text}",
        style: isSelected ? appStyles.body.copyWith(color: appColors.onPrimary) : appStyles.body.copyWith(color: appColors.textPrimary),
      ),
    );
  }
}
