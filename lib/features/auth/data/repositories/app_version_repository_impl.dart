import 'dart:convert';
import 'package:client_app/features/auth/domain/repositories/app_version_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import '../../../../core/constants/app_environment.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/error/server_exception.dart';

class AppVersionRepositoryImpl implements AppVersionRepository {
  @override
  Future<Either<Failure, int>> getCurrentAppBuildNumber() async {
    try {
      final url = Uri.parse("${AppEnvironment().baseUrl}/app/version");
      final response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
      );
      final data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw ServerException(data['message']);
      }
      final buildNumber = data['buildNumber'] as int;
      return right(buildNumber);
    } catch (e) {
      return left(Failure("Build number not available"));
    }
  }
}
