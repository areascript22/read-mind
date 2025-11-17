import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';

abstract interface class AppVersionRepository {
  Future<Either<Failure, int>> getCurrentAppBuildNumber();
}
