import 'package:client_app/core/common/features/preferences/domian/entity/preferences_entitty.dart';
import 'package:client_app/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class PreferencesRepository {
  Future<Either<Failure, PreferencesEntity>> updateDialogNotificationSeen({
    required int userId,
  });

  Future<Either<Failure, PreferencesEntity>> getPreferences({
    required int userId,
  });
}
