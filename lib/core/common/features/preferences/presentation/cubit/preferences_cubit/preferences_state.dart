part of 'preferences_cubit.dart';

@immutable
sealed class PreferencesState {}

final class PreferencesInitial extends PreferencesState {}

final class PreferencesLoading extends PreferencesState {
  final PreferenceAction preferenceAction;

  PreferencesLoading({required this.preferenceAction});
}

final class PreferencesError extends PreferencesState {
  final String message;
  final PreferenceAction preferenceAction;

  PreferencesError({required this.message, required this.preferenceAction});
}

final class PreferencesLoaded extends PreferencesState {
  final PreferencesEntity preferencesEntity;
  final PreferenceAction preferenceAction;

  PreferencesLoaded({
    required this.preferencesEntity,
    required this.preferenceAction,
  });
}

enum PreferenceAction { load, updateNotifyDialogSeen }
