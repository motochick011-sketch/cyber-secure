import 'package:cybersecure/core/cubit/view_state.dart';
import 'package:cybersecure/core/di/injector.dart';
import 'package:cybersecure/core/di/locators.dart';
import 'package:cybersecure/core/navigation/navigation_cubit/navigation_cubit.dart';
import 'package:cybersecure/core/navigation/sub_screen.dart';
import 'package:cybersecure/design_system/theme/theme_access.dart';
import 'package:cybersecure/design_system/widgets/feedback/loading_indicator.dart';
import 'package:cybersecure/design_system/widgets/scaffolding/app_container.dart';
import 'package:cybersecure/design_system/widgets/scaffolding/app_scaffold.dart';
import 'package:cybersecure/design_system/widgets/text/title_widget.dart';
import 'package:cybersecure/features/quiz/domain/models/quiz.dart';
import 'package:cybersecure/features/quiz/quiz_cubit/quiz_cubit.dart';
import 'package:cybersecure/features/quiz/quiz_cubit/quiz_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizSelectScreen extends StatelessWidget {
  const QuizSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      showBack: true,
      child: BlocBuilder<QuizCubit, QuizState>(
        bloc: getIt.quiz,
        builder: (context, state) {
          final category = state.data.selectedCategory;
          final quizzes = state.data.categoryQuizzes;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleWidget(title: category?.displayName ?? "Quizzes", subtitle: "Choose which quiz to take", size: TitleSize.large),
                SizedBox(height: appTokens.space24),
                if (state.status == Status.loading)
                  Center(child: LoadingIndicator())
                else if (quizzes.isEmpty)
                  AppContainer(
                    width: double.infinity,
                    type: ContainerType.borderOnly,
                    child: Text("No quizzes in this topic yet.", style: appStyles.hint.copyWith(color: appColors.textSecondary)),
                  )
                else
                  ...quizzes.map(quizTile),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget quizTile(Quiz quiz) {
    return Padding(
      padding: EdgeInsets.only(bottom: appTokens.space12),
      child: AppContainer(
        width: double.infinity,
        onTap: () {
          getIt.quiz.selectQuiz(quiz.id);
          getIt<NavigationCubit>().push(SubScreen.quizQuestions);
        },
        child: TitleWidget(title: quiz.title, subtitle: quiz.subtitle),
      ),
    );
  }
}
