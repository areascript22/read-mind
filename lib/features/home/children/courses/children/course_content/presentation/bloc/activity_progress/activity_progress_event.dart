part of 'activity_progress_bloc.dart';

@immutable
sealed class ActivityProgressEvent {}

class CreateInitialProgressEvent extends ActivityProgressEvent {
  final int aiReadingId;
  final int activityId;

  CreateInitialProgressEvent({
    required this.aiReadingId,
    required this.activityId,
  });
}

class UpdateProgressEvent extends ActivityProgressEvent {
  final int aiReadingId;
  final Map<String, dynamic> dataToUpdate;

  UpdateProgressEvent({required this.aiReadingId, required this.dataToUpdate});
}
