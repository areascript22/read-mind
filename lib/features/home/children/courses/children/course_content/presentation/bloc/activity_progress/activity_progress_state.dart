part of 'activity_progress_bloc.dart';

@immutable
sealed class ActivityProgressState {}

final class ActivityProgressInitial extends ActivityProgressState {}

final class ProgressLoading extends ActivityProgressState {
  final ProgressActOperation operation;
  final int activityId;

  ProgressLoading({required this.operation, required this.activityId});
}

final class ProgressError extends ActivityProgressState {
  final ProgressActOperation operation;
  final String message;
  final int activityId;

  ProgressError({
    required this.operation,
    required this.message,
    required this.activityId,
  });
}

final class ProgressCreated extends ActivityProgressState {
  final ProgressEntity createdProgress;
  final int activityId;

  ProgressCreated({required this.createdProgress, required this.activityId});
}

final class ProgressUpdated extends ActivityProgressState {
  final ProgressEntity updatedProgress;
  final int activityId;

  ProgressUpdated({required this.updatedProgress, required this.activityId});
}

enum ProgressActOperation { create, update }
