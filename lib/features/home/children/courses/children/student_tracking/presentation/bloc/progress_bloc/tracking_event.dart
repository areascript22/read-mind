part of 'tracking_bloc.dart';

@immutable
sealed class TrackingEvent {}

class LoadTrackingEvent extends TrackingEvent {
  final int userId;

  LoadTrackingEvent({required this.userId});
}

final class FetchAllParaphrasesAttempts extends TrackingEvent {
  final int aiReadingId;

  FetchAllParaphrasesAttempts({required this.aiReadingId});
}

final class FetchAllMainIdeasAttempts extends TrackingEvent {
  final int aiReadingId;

  FetchAllMainIdeasAttempts({required this.aiReadingId});
}

final class FetchAllSummaryAttempts extends TrackingEvent {
  final int aiReadingId;

  FetchAllSummaryAttempts({required this.aiReadingId});
}
