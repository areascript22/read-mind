enum AppFlavors { dev, prod }

class FlavorConfig {
  static const String _flavor = String.fromEnvironment(
    'FLAVOR',
    defaultValue: 'dev',
  );

  static AppFlavors get current {
    switch (_flavor) {
      case 'prod':
        return AppFlavors.prod;
      case 'dev':
      default:
        return AppFlavors.dev;
    }
  }

  static bool get isProd => current == AppFlavors.prod;
  static bool get isDev => current == AppFlavors.dev;
}
