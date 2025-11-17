part of 'app_version_cubit.dart';

@immutable
sealed class AppVersionState {}

final class AppVersionInitial extends AppVersionState {}

final class AppVersionLoading extends AppVersionState {}

final class AppVersionError extends AppVersionState {
  final String message;

  AppVersionError({required this.message});
}

final class AppVersionLoaded extends AppVersionState {
  final bool isUpToDate;

  AppVersionLoaded({required this.isUpToDate});
}
