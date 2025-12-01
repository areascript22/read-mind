part of 'timer_attempt_cubit.dart';

@immutable
class TimerAttemptState {
  final DateTime startTime;
  final DateTime completeTime;

  const TimerAttemptState({
    required this.startTime,
    required this.completeTime,
  });

  TimerAttemptState copyWith({DateTime? startTime, DateTime? completeTime}) {
    return TimerAttemptState(
      startTime: startTime ?? this.startTime,
      completeTime: completeTime ?? this.completeTime,
    );
  }
}
