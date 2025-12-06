part of 'timer_attempt_cubit.dart';

@immutable
class TimerAttemptState {
  final DateTime startTime;
  final DateTime completeTime;
  final int playCount;

  const TimerAttemptState({
    required this.startTime,
    required this.completeTime,
    this.playCount = 0,
  });

  TimerAttemptState copyWith({
    DateTime? startTime,
    DateTime? completeTime,
    int? playCount,
  }) {
    return TimerAttemptState(
      startTime: startTime ?? this.startTime,
      completeTime: completeTime ?? this.completeTime,
      playCount: playCount ?? this.playCount,
    );
  }
}
