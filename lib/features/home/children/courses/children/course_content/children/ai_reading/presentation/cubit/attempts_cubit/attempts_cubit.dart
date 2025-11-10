import 'package:bloc/bloc.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/domain/repository/attempts_repository.dart';
import 'package:client_app/features/home/children/courses/domain/entities/main_idea_attempt_entity.dart';
import 'package:client_app/features/home/children/courses/domain/entities/paraphrase_attempt_entity.dart';
import 'package:client_app/features/home/children/courses/domain/entities/summary_attempt_entity.dart';
import 'package:meta/meta.dart';

part 'attempts_state.dart';

class AttemptsCubit extends Cubit<AttemptsState> {
  final AttemptsRepository attemptsRepository;
  AttemptsCubit({required this.attemptsRepository}) : super(AttemptsInitial());

  void createParaphraseAttempt({
    required int aiReadingId,
    required int similarityScore,
    required int fluencyScore,
    required int originalityScore,
    required String feedback,
  }) async {
    emit(AttemptsLoading(attemptOperation: AttemptOperation.paraphrase));
    final response = await attemptsRepository.createParaphraseAttempt(
      aiReadingId: aiReadingId,
      similarityScore: similarityScore,
      fluencyScore: fluencyScore,
      originalityScore: originalityScore,
      feedback: feedback,
    );
    response.fold(
      (l) => emit(
        AttemptsError(
          attemptOperation: AttemptOperation.paraphrase,
          message: l.message,
        ),
      ),
      (r) => emit(AttemptParaphraseCreated(paraphraseAttemptEntity: r)),
    );
  }

  void createMainIdeaAttempt({
    required int aiReadingId,
    required int accuracyScore,
    required int clarityScore,
    required int concisenessScore,
    required String feedback,
  }) async {
    emit(AttemptsLoading(attemptOperation: AttemptOperation.mainIdea));
    final response = await attemptsRepository.createMainIdeaAttempt(
      aiReadingId: aiReadingId,
      accuracyScore: accuracyScore,
      clarityScore: clarityScore,
      concisenessScore: concisenessScore,
      feedback: feedback,
    );
    response.fold(
      (l) => emit(
        AttemptsError(
          attemptOperation: AttemptOperation.mainIdea,
          message: l.message,
        ),
      ),
      (r) => emit(AttemptMainIdeaCreated(mainIdeaAttemptEntity: r)),
    );
  }

  void createSummaryAttempt({
    required int aiReadingId,
    required int accuracyScore,
    required int coverageScore,
    required int clarityScore,
    required String feedback,
  }) async {
    emit(AttemptsLoading(attemptOperation: AttemptOperation.summary));
    final response = await attemptsRepository.createSummaryAttempt(
      aiReadingId: aiReadingId,
      accuracyScore: accuracyScore,
      coverageScore: coverageScore,
      clarityScore: clarityScore,
      feedback: feedback,
    );
    response.fold(
      (l) => emit(
        AttemptsError(
          attemptOperation: AttemptOperation.summary,
          message: l.message,
        ),
      ),
      (r) => emit(AttemptSummaryCreated(summaryAttemptEntity: r)),
    );
  }

  void getAllParaphraseAttempts({required int aiReadingId}) async {
    emit(AttemptsLoading(attemptOperation: AttemptOperation.paraphraseAll));
    final response = await attemptsRepository.getAllParaphraseAttempts(
      aiReadingId: aiReadingId,
    );
    response.fold(
      (l) => emit(
        AttemptsError(
          attemptOperation: AttemptOperation.paraphraseAll,
          message: l.message,
        ),
      ),
      (r) => emit(AttemptParaphraseAll(paraphrases: r)),
    );
  }

  void getAllMainIdeaAttempts(int aiReadingId) async {
    emit(AttemptsLoading(attemptOperation: AttemptOperation.mainIdeaAll));
    final response = await attemptsRepository.getAllMainIdeaAttempts(
      aiReadingId: aiReadingId,
    );
    response.fold(
      (l) => emit(
        AttemptsError(
          attemptOperation: AttemptOperation.mainIdeaAll,
          message: l.message,
        ),
      ),
      (r) => emit(AttemptMainIdeaAll(mainIdeas: r)),
    );
  }

  void getAllSummaryAttempts(int aiReadingId) async {
    emit(AttemptsLoading(attemptOperation: AttemptOperation.summaryAll));
    final response = await attemptsRepository.getAllSummaryAttempts(
      aiReadingId: aiReadingId,
    );
    response.fold(
      (l) => emit(
        AttemptsError(
          attemptOperation: AttemptOperation.summaryAll,
          message: l.message,
        ),
      ),
      (r) => emit(AttemptSummaryAll(summaries: r)),
    );
  }
}
