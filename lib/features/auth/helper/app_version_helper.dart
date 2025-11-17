import 'package:fpdart/fpdart.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../../core/error/failure.dart';

class AppVersionHelper {
  Future<Either<Failure, int>> getBuildNumber() async {
    try {
      final info = await PackageInfo.fromPlatform();
      final num = int.tryParse(info.buildNumber);

      if (num == null) {
        return Left(Failure("Invalid build number format"));
      }

      return Right(num);
    } catch (e) {
      return Left(Failure("Error retrieving build number: $e"));
    }
  }
}
