import 'package:client_app/core/common/entities/user_entity.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';

abstract interface class InitialValuesRepository {
  Future<Either<Failure, int>> getCurrentAppBuildNumber();
  Future<Either<Failure, UserEntity>> updateFCMToken({
    required String fcmToken,
  });
}
