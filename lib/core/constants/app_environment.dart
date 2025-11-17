class AppEnvironment {
  static final AppEnvironment _instance = AppEnvironment._internal();
  factory AppEnvironment() => _instance;
  AppEnvironment._internal();

  String baseUrl = "";
}
