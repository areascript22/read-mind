part of 'progress_bloc.dart';

@immutable
sealed class ProgressState {}

final class ProgressInitial extends ProgressState {}

final class ProgressLoading extends ProgressState {
  final ProgressOperation operation;

  ProgressLoading({required this.operation});
}

final class ProgressError extends ProgressState {
  final ProgressOperation operation;
  final String message;

  ProgressError({required this.operation, required this.message});
}

final class ProgressLoaded extends ProgressState {
  final TrackingEntity trackingData;

  ProgressLoaded({required this.trackingData});
}

final class ProgressCreated extends ProgressState {
  final ProgressEntity createdProgress;

  ProgressCreated({required this.createdProgress});
}

final class ProgressUpdated extends ProgressState {
  final ProgressEntity updatedProgress;

  ProgressUpdated({required this.updatedProgress});
}

enum ProgressOperation { load, create, update }
