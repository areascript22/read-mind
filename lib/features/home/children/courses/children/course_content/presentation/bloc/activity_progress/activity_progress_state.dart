part of 'activity_progress_bloc.dart';

@immutable
sealed class ActivityProgressState {}

final class ActivityProgressInitial extends ActivityProgressState {}

final class ProgressLoading extends ActivityProgressState {
  final ProgressActOperation operation;
  final int aiReadingId;

  ProgressLoading({required this.operation, required this.aiReadingId});
}

final class ProgressError extends ActivityProgressState {
  final ProgressActOperation operation;
  final String message;
  final int aiReadingId;

  ProgressError({
    required this.operation,
    required this.message,
    required this.aiReadingId,
  });
}

final class ProgressCreated extends ActivityProgressState {
  final ProgressModel createdProgress;
  final int aiReadingId;

  ProgressCreated({required this.createdProgress, required this.aiReadingId});
}

final class ProgressUpdated extends ActivityProgressState {
  final ProgressModel updatedProgress;
  final int aiReadingId;

  ProgressUpdated({required this.updatedProgress, required this.aiReadingId});
}

final class ProgressActivityOverdue extends ActivityProgressState {
  final int aiReadingId;

  ProgressActivityOverdue({required this.aiReadingId});
}

enum ProgressActOperation { create, update }
