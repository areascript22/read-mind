import 'package:client_app/core/error/failure.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/data/datasource/local_datasource/local_reading_progress_datasource%20.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/domain/repository/ai_reading_local_repository.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../../../../../../../core/error/server_exception.dart';

class AiReadingLocalRepositoryImpl implements AiReadingLocalRepository {
  final LocalReadingProgressDataSource localReadingProgressDatasource;

  AiReadingLocalRepositoryImpl({required this.localReadingProgressDatasource});

  @override
  Future<Either<Failure, bool>> isAiReadingCompleted({
    required int activityId,
  }) async {
    try {
      final aiReading = localReadingProgressDatasource.isAiReadingCompleted(
        activityId,
      );
      return Right(aiReading);
    } catch (e) {
      debugPrint("Error loading ai reading completion: $e");
      if (e is ServerException) {
        return left(Failure(e.message));
      }
      return left(Failure("No se pudo cargar el valor"));
    }
  }

  @override
  Future<Either<Failure, bool>> isAiMainIdeaCompleted({
    required int activityId,
  }) async {
    try {
      final aiReading = localReadingProgressDatasource.isMainIdeaCompleted(
        activityId,
      );
      return Right(aiReading);
    } catch (e) {
      debugPrint("Error loading main idea completion: $e");
      if (e is ServerException) {
        return left(Failure(e.message));
      }
      return left(Failure("No se pudo cargar el valor"));
    }
  }

  @override
  Future<Either<Failure, bool>> isAiParaphraseCompleted({
    required int activityId,
  }) async {
    try {
      final aiReading = localReadingProgressDatasource.isParaphraseCompleted(
        activityId,
      );
      return Right(aiReading);
    } catch (e) {
      debugPrint("Error loading paraphrase completion: $e");
      if (e is ServerException) {
        return left(Failure(e.message));
      }
      return left(Failure("No se pudo cargar el valor"));
    }
  }

  @override
  Future<Either<Failure, bool>> isAiSummaryCompleted({
    required int activityId,
  }) async {
    try {
      final aiReading = localReadingProgressDatasource.isSummaryCompleted(
        activityId,
      );
      return Right(aiReading);
    } catch (e) {
      debugPrint("Error loading summary completion: $e");
      if (e is ServerException) {
        return left(Failure(e.message));
      }
      return left(Failure("No se pudo cargar el valor"));
    }
  }

  @override
  Future<Either<Failure, bool>> setAiReadingCompletion({
    required int activityId,
  }) async {
    try {
      final aiReading = await localReadingProgressDatasource
          .setAiReadingCompleted(true, activityId);
      return Right(aiReading);
    } catch (e) {
      debugPrint("Error setting ai reading completion: $e");
      if (e is ServerException) {
        return left(Failure(e.message));
      }
      return left(Failure("No se guardar el valor"));
    }
  }
}
