part of 'tracking_bloc.dart';

@immutable
sealed class TrackingEvent {}

class LoadTrackingEvent extends TrackingEvent {
  final int userId;

  LoadTrackingEvent({required this.userId});
}

final class FetchAllParaphrasesAttempts extends TrackingEvent {
  final int aiReadingId;
  final int targetUserId;

  FetchAllParaphrasesAttempts({
    required this.aiReadingId,
    required this.targetUserId,
  });
}

final class FetchAllMainIdeasAttempts extends TrackingEvent {
  final int aiReadingId;
  final int targetUserId;

  FetchAllMainIdeasAttempts({
    required this.aiReadingId,
    required this.targetUserId,
  });
}

final class FetchAllSummaryAttempts extends TrackingEvent {
  final int aiReadingId;
  final int targetUserId;

  FetchAllSummaryAttempts({
    required this.aiReadingId,
    required this.targetUserId,
  });
}
