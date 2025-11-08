part of 'activity_progress_bloc.dart';

@immutable
sealed class ActivityProgressState {}

final class ActivityProgressInitial extends ActivityProgressState {}

final class ProgressLoading extends ActivityProgressState {
  final ProgressActOperation operation;

  ProgressLoading({required this.operation});
}

final class ProgressError extends ActivityProgressState {
  final ProgressActOperation operation;
  final String message;

  ProgressError({required this.operation, required this.message});
}

final class ProgressCreated extends ActivityProgressState {
  final ProgressEntity createdProgress;

  ProgressCreated({required this.createdProgress});
}

final class ProgressUpdated extends ActivityProgressState {
  final ProgressEntity updatedProgress;

  ProgressUpdated({required this.updatedProgress});
}

enum ProgressActOperation { create, update }
