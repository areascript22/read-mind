import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'timer_attempt_state.dart';

class TimerAttemptCubit extends Cubit<TimerAttemptState> {
  TimerAttemptCubit()
    : super(
        TimerAttemptState(
          startTime: DateTime.now(),
          completeTime: DateTime.now(),
        ),
      );

  // --- Setters ---
  void setStartTime(DateTime value) {
    emit(state.copyWith(startTime: value));
  }

  void setCompleteTime(DateTime value) {
    emit(state.copyWith(completeTime: value));
  }

  // --- Getters (opcionales) ---
  DateTime get startTime => state.startTime;
  DateTime get completeTime => state.completeTime;
  int get totalTimeSec =>
      state.completeTime.difference(state.startTime).inSeconds;

  // Reset (si lo necesitas)
  void reset() {
    emit(
      TimerAttemptState(
        startTime: DateTime.now(),
        completeTime: DateTime.now(),
      ),
    );
  }
}
