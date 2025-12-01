import 'package:bloc/bloc.dart';
import 'package:client_app/core/common/features/preferences/domian/entity/preferences_entitty.dart';
import 'package:client_app/core/common/features/preferences/domian/repository/preferences_repository.dart';
import 'package:flutter/material.dart';

part 'preferences_state.dart';

class PreferencesCubit extends Cubit<PreferencesState> {
  final PreferencesRepository preferencesRepository;
  PreferencesCubit({required this.preferencesRepository})
    : super(PreferencesInitial());

  void loadPreferences({required int userId}) async {
    emit(PreferencesLoading(preferenceAction: PreferenceAction.load));
    final response = await preferencesRepository.getPreferences(userId: userId);
    response.fold(
      (l) => emit(
        PreferencesError(
          message: l.message,
          preferenceAction: PreferenceAction.load,
        ),
      ),
      (r) => emit(
        PreferencesLoaded(
          preferencesEntity: r,
          preferenceAction: PreferenceAction.load,
        ),
      ),
    );
  }

  void updateNotificationDialogSeen({required int userId}) async {
    emit(
      PreferencesLoading(
        preferenceAction: PreferenceAction.updateNotifyDialogSeen,
      ),
    );
    final response = await preferencesRepository.updateDialogNotificationSeen(
      userId: userId,
    );
    response.fold(
      (l) => emit(
        PreferencesError(
          message: l.message,
          preferenceAction: PreferenceAction.updateNotifyDialogSeen,
        ),
      ),
      (r) => emit(
        PreferencesLoaded(
          preferencesEntity: r,
          preferenceAction: PreferenceAction.updateNotifyDialogSeen,
        ),
      ),
    );
  }
}
