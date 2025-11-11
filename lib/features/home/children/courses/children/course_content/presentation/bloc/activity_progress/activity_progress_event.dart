part of 'activity_progress_bloc.dart';

@immutable
sealed class ActivityProgressEvent {}

class CreateInitialProgressEvent extends ActivityProgressEvent {
  final int aiReadingId;

  CreateInitialProgressEvent({required this.aiReadingId});
}

class UpdateProgressEvent extends ActivityProgressEvent {
  final int aiReadingId;
  final Map<String, dynamic> dataToUpdate;

  UpdateProgressEvent({required this.aiReadingId, required this.dataToUpdate});
}
