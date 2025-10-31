import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:client_app/features/home/domain/entity/translation_entity.dart';

import '../../../domain/repository/vocabulary_repository.dart';

part 'vocabulary_event.dart';
part 'vocabulary_state.dart';

class VocabularyBloc extends Bloc<VocabularyEvent, VocabularyState> {
  final VocabularyRepository vocabularyRepository;

  VocabularyBloc({required this.vocabularyRepository})
    : super(VocabularyInitial()) {
    on<LoadAllTranslations>(_onLoadAllTranslations);
  }

  Future<void> _onLoadAllTranslations(
    LoadAllTranslations event,
    Emitter<VocabularyState> emit,
  ) async {
    emit(VocabularyLoading());

    final result = await vocabularyRepository.getAllTranslations();

    result.fold((failure) => emit(VocabularyError(failure.message)), (
      translations,
    ) {
      if (translations.isEmpty) {
        emit(VocabularyEmpty());
      } else {
        emit(VocabularyLoaded(translations));
      }
    });
  }
}
