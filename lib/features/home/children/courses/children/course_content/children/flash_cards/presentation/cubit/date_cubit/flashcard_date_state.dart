part of 'flashcard_date_cubit.dart';

@immutable
sealed class DateState {}

final class DateInitial extends DateState {}

final class DateLoadingState extends DateState {
  final int currentFlashCardActivity;

  DateLoadingState({required this.currentFlashCardActivity});
}

final class DateErrorState extends DateState {
  final String message;
  final int currentFlashCardActivity;

  DateErrorState({
    required this.message,
    required this.currentFlashCardActivity,
  });
}

final class DateSuccess extends DateState {
  final bool isOverdue;
  final int currentFlashCardActivity;

  DateSuccess({
    required this.isOverdue,
    required this.currentFlashCardActivity,
  });
}
