import 'package:client_app/core/config/flavor_config.dart';
import 'package:client_app/core/constants/app_environment.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> initGlobalConfig() async {
  await _initDotEnvValues();
}

Future<void> _initDotEnvValues() async {
  final currentFlavor = FlavorConfig.current;
  final filename =
      currentFlavor == AppFlavors.dev
          ? 'assets/env/.env.dev'
          : 'assets/env/.env.prod';
  await dotenv.load(fileName: filename);
  AppEnvironment().baseUrl = dotenv.env["BASE_URL"] ?? "";
}
