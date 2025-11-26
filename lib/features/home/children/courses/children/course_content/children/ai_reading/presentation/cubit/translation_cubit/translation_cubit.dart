import 'package:bloc/bloc.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/domain/repository/ai_reading_repository.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../domain/entity/translation_entity.dart';

part 'translation_state.dart';

class TranslationCubit extends Cubit<TranslationState> {
  final AiReadingRepository aiReadingRepository;

  TranslationCubit({required this.aiReadingRepository})
    : super(TranslationInitial());

  /// Calls the translateWord method from the repository and handles states
  Future<void> translateWord(String text, int readingid) async {
    emit(TranslationLoading());

    final result = await aiReadingRepository.translateWord(
      text: text,
      readingId: readingid,
    );

    result.fold(
      (failure) => emit(TranslationFailure(failure.message)),
      (translation) => emit(TranslationSuccess(translation)),
    );
  }
}
