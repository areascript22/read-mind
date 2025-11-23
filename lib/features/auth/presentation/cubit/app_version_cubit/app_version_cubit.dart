import 'package:bloc/bloc.dart';
import 'package:client_app/features/auth/domain/repositories/initial_values_repository.dart';
import 'package:client_app/features/auth/helper/app_version_helper.dart';
import 'package:flutter/material.dart';
part 'app_version_state.dart';

class AppVersionCubit extends Cubit<AppVersionState> {
  final InitialValuesRepository appVersionRepository;
  final AppVersionHelper appVersionHelper;

  AppVersionCubit({
    required this.appVersionRepository,
    required this.appVersionHelper,
  }) : super(AppVersionInitial());

  Future<void> checkAppVersion() async {
    emit(AppVersionLoading());
    final localBuildEither = await appVersionHelper.getBuildNumber();
    return localBuildEither.fold(
      (failure) {
        emit(AppVersionError(message: failure.message));
      },
      (localBuildNumber) async {
        final remoteBuildEither =
            await appVersionRepository.getCurrentAppBuildNumber();
        remoteBuildEither.fold(
          (failure) {
            emit(AppVersionError(message: failure.message));
          },
          (remoteBuildNumber) {
            final isUpToDate = localBuildNumber >= remoteBuildNumber;
            emit(AppVersionLoaded(isUpToDate: isUpToDate));
          },
        );
      },
    );
  }
}
