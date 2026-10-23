library;

enum AppEnvironment {
  prod;

  static AppEnvironment current() {
    return AppEnvironment.prod;
  }
}
