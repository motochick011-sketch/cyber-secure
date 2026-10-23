import 'package:cybersecure/features/home/presentation/overview/overviewScreen.dart';
import 'package:cybersecure/features/home/presentation/resources/resourcesScreen.dart';
import 'package:cybersecure/features/home/presentation/securityCheckup/security_checkup_screen.dart';
import 'package:cybersecure/features/learn/presentation/lesson_screen.dart';
import 'package:cybersecure/features/quiz/presentation/quiz_questions_screen.dart';
import 'package:cybersecure/features/quiz/presentation/quiz_result_screen.dart';
import 'package:cybersecure/features/quiz/presentation/quiz_select_screen.dart';
import 'package:flutter/widgets.dart';

enum SubScreen {
  lesson(builder: LessonScreen.new),
  quizSelect(builder: QuizSelectScreen.new),
  quizQuestions(builder: QuizQuestionsScreen.new),
  quizResult(builder: QuizResultScreen.new),
  securityCheckupScreen(builder: SecurityCheckupScreen.new),
  overviewScreen(builder: Overviewscreen.new),
  resourcesScreen(builder: Resourcesscreen.new);

  const SubScreen({required this.builder});

  final Widget Function() builder;
}
