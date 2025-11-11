import 'dart:convert';
import 'package:client_app/core/error/failure.dart';
import 'package:client_app/features/home/children/courses/domain/repository/attempts_repository.dart';
import 'package:client_app/features/home/children/courses/data/models/main_idea_attempt/main_idea_attempt.dart';
import 'package:client_app/features/home/children/courses/data/models/paraphrase_attempt/paraphrase_attempt.dart';
import 'package:client_app/features/home/children/courses/data/models/summary_attempt/summary_attempt.dart';
import 'package:client_app/features/home/children/courses/domain/entities/paraphrase_attempt_entity.dart';
import 'package:client_app/features/home/children/courses/domain/entities/summary_attempt_entity.dart';
import 'package:client_app/shared/datasources/auth_local_datasource.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import '../../../../../../core/constants/app_environment.dart';
import '../../../../../../core/error/server_exception.dart';
import '../../domain/entities/main_idea_attempt_entity.dart';

class AttemptsRepositoryImpl implements AttemptsRepository {
  final AuthLocalDataSource authLocalDataSource;

  AttemptsRepositoryImpl({required this.authLocalDataSource});

  @override
  Future<Either<Failure, MainIdeaAttemptEntity>> createMainIdeaAttempt({
    required int aiReadingId,
    required int accuracyScore,
    required int clarityScore,
    required int concisenessScore,
    required String feedback,
  }) async {
    final url = Uri.parse(
      "${AppEnvironment().baseUrl}/courseActivity/mainIdea/attempt",
    );

    try {
      final token = await authLocalDataSource.getJwt();
      if (token == null) {
        return left(Failure("No autenticado. Inicia sesión de nuevo"));
      }

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json", "x-token": token},
        body: jsonEncode({
          "aiReadingId": aiReadingId,
          "accuracyScore": accuracyScore,
          "clarityScore": clarityScore,
          "concisenessScore": concisenessScore,
          "feedback": feedback,
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode != 201) {
        throw ServerException(data['message'] ?? "Error al crear el intento");
      }

      final mainIdeaModel = MainIdeaAttemptModel.fromJson(data['data']);

      return Right(mainIdeaModel.toEntity());
    } catch (e) {
      debugPrint("Error creating main idea attempt $e");
      if (e is ServerException) {
        return left(Failure(e.message));
      }
      return left(Failure("No se pudo guardar el intento"));
    }
  }

  @override
  Future<Either<Failure, ParaphraseAttemptEntity>> createParaphraseAttempt({
    required int aiReadingId,
    required int similarityScore,
    required int fluencyScore,
    required int originalityScore,
    required String feedback,
  }) async {
    final url = Uri.parse(
      "${AppEnvironment().baseUrl}/courseActivity/paraphrase/attempt",
    );

    try {
      final token = await authLocalDataSource.getJwt();
      if (token == null) {
        return left(Failure("No autenticado. Inicia sesión de nuevo"));
      }

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json", "x-token": token},
        body: jsonEncode({
          "aiReadingId": aiReadingId,
          "similarityScore": similarityScore,
          "fluencyScore": fluencyScore,
          "originalityScore": originalityScore,
          "feedback": feedback,
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode != 201) {
        throw ServerException(data['message'] ?? "Error al crear el intento");
      }

      final paraphraseAttempt = ParaphraseAttemptModel.fromJson(data['data']);

      return Right(paraphraseAttempt.toEntity());
    } catch (e) {
      debugPrint("Error creating paraphrase attempt $e");
      if (e is ServerException) {
        return left(Failure(e.message));
      }
      return left(Failure("No se pudo guardar el intento"));
    }
  }

  @override
  Future<Either<Failure, SummaryAttemptEntity>> createSummaryAttempt({
    required int aiReadingId,
    required int accuracyScore,
    required int coverageScore,
    required int clarityScore,
    required String feedback,
  }) async {
    final url = Uri.parse(
      "${AppEnvironment().baseUrl}/courseActivity/summary/attempt",
    );

    try {
      final token = await authLocalDataSource.getJwt();
      if (token == null) {
        return left(Failure("No autenticado. Inicia sesión de nuevo"));
      }

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json", "x-token": token},
        body: jsonEncode({
          "aiReadingId": aiReadingId,
          "accuracyScore": accuracyScore,
          "coverageScore": coverageScore,
          "clarityScore": clarityScore,
          "feedback": feedback,
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode != 201) {
        throw ServerException(data['message'] ?? "Error al crear el intento");
      }

      final summaryAttempt = SummaryAttemptModel.fromJson(data['data']);

      return Right(summaryAttempt.toEntity());
    } catch (e) {
      debugPrint("Error creating summary attempt $e");
      if (e is ServerException) {
        return left(Failure(e.message));
      }
      return left(Failure("No se pudo guardar el intento"));
    }
  }

  @override
  Future<Either<Failure, List<MainIdeaAttemptEntity>>> getAllMainIdeaAttempts({
    required int aiReadingId,
    required int targetUserId,
  }) async {
    final url = Uri.parse(
      "${AppEnvironment().baseUrl}/attempts/mainIdea/$aiReadingId",
    ).replace(queryParameters: {"targetUserId": targetUserId.toString()});
    ;

    try {
      final token = await authLocalDataSource.getJwt();
      if (token == null) {
        return left(Failure("No autenticado. Inicia sesión de nuevo"));
      }

      final response = await http.get(
        url,
        headers: {"Content-Type": "application/json", "x-token": token},
      );

      final data = jsonDecode(response.body);

      if (response.statusCode != 200) {
        throw ServerException(data['message'] ?? "Error al obtener registros");
      }

      final mainIdeas =
          (data['data'] as List)
              .map((e) => MainIdeaAttemptModel.fromJson(e).toEntity())
              .toList();

      return Right(mainIdeas);
    } catch (e) {
      debugPrint("Error getting all main ideas attempts $e");
      if (e is ServerException) {
        return left(Failure(e.message));
      }
      return left(Failure("No se pudo cargar los datos"));
    }
  }

  @override
  Future<Either<Failure, List<ParaphraseAttemptEntity>>>
  getAllParaphraseAttempts({
    required int aiReadingId,
    required int targetUserId,
  }) async {
    final url = Uri.parse(
      "${AppEnvironment().baseUrl}/attempts/paraphrase/$aiReadingId",
    ).replace(queryParameters: {"targetUserId": targetUserId.toString()});

    try {
      final token = await authLocalDataSource.getJwt();
      if (token == null) {
        return left(Failure("No autenticado. Inicia sesión de nuevo"));
      }

      final response = await http.get(
        url,
        headers: {"Content-Type": "application/json", "x-token": token},
      );

      final data = jsonDecode(response.body);

      if (response.statusCode != 200) {
        throw ServerException(data['message'] ?? "Error al obtener registros");
      }

      final paraphrases =
          (data['data'] as List)
              .map((e) => ParaphraseAttemptModel.fromJson(e).toEntity())
              .toList();
      debugPrint('All paraphrases: ${paraphrases}');

      return Right(paraphrases);
    } catch (e) {
      debugPrint("Error getting all paraphrase attempts $e");
      if (e is ServerException) {
        return left(Failure(e.message));
      }
      return left(Failure("No se pudo cargar los datos"));
    }
  }

  @override
  Future<Either<Failure, List<SummaryAttemptEntity>>> getAllSummaryAttempts({
    required int aiReadingId,
    required int targetUserId,
  }) async {
    final url = Uri.parse(
      "${AppEnvironment().baseUrl}/attempts/summary/$aiReadingId",
    ).replace(queryParameters: {"targetUserId": targetUserId.toString()});
    ;

    try {
      final token = await authLocalDataSource.getJwt();
      if (token == null) {
        return left(Failure("No autenticado. Inicia sesión de nuevo"));
      }

      final response = await http.get(
        url,
        headers: {"Content-Type": "application/json", "x-token": token},
      );

      final data = jsonDecode(response.body);

      if (response.statusCode != 200) {
        throw ServerException(data['message'] ?? "Error al obtener registros");
      }

      final summaries =
          (data['data'] as List)
              .map((e) => SummaryAttemptModel.fromJson(e).toEntity())
              .toList();

      return Right(summaries);
    } catch (e) {
      debugPrint("Error getting all summary attempts $e");
      if (e is ServerException) {
        return left(Failure(e.message));
      }
      return left(Failure("No se pudo cargar los datos"));
    }
  }
}
