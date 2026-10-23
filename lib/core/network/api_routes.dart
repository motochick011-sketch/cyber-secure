abstract final class ApiRoutes {
  static const login = '/auth/login';
  static const register = '/auth/register';
  static const forgotPassword = '/auth/forgot-password';
  static const refresh = '/auth/refresh';
  static const me = '/auth/me';

  static const getAchievements = '/profile/achievements';
  static const getLearningStatus = '/profile/learning-status';
  static const updateProfile = '/profile/update';

  static const getQuizzes = '/quiz/get';
  static const submitQuiz = '/quiz/submit';

  static const getLessons = '/learn/get';

  static const logs = '/logs';
}
