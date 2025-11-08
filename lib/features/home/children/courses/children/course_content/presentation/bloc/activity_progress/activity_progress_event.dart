part of 'activity_progress_bloc.dart';

@immutable
sealed class ActivityProgressEvent {}

class CreateInitialProgressEvent extends ActivityProgressEvent {
  final int activityId;

  CreateInitialProgressEvent({required this.activityId});
}

class UpdateProgressEvent extends ActivityProgressEvent {
  final int activityId;
  final Map<String, dynamic> dataToUpdate;

  UpdateProgressEvent({required this.activityId, required this.dataToUpdate});
}
