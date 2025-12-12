import 'dart:convert';
import 'package:client_app/core/error/failure.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/flash_cards/data/model/flashcard_attempt/flashcard_attempt.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/flash_cards/data/model/flashcard_session/flashcard_session.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/flash_cards/domain/entity/flashcard_attempt.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/flash_cards/domain/entity/flashcard_session_entity.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/flash_cards/domain/repository/flash_card_repository.dart';
import 'package:client_app/features/home/children/courses/children/course_content/data/models/activity_model/activity_model.dart';
import 'package:client_app/features/home/children/courses/children/course_content/domain/entities/flash_card_entity.dart';
import 'package:client_app/features/home/data/model/translation_model/translation_model.dart';
import 'package:client_app/features/home/domain/entity/translation_entity.dart';
import 'package:client_app/shared/datasources/auth_local_datasource.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import '../../../../../../../../../../core/constants/app_environment.dart';
import '../../../../../../../../../../core/error/server_exception.dart';

class FlashCardRepositoryImpl implements FlashCardRepository {
  final AuthLocalDataSource authLocalDataSource;

  FlashCardRepositoryImpl({required this.authLocalDataSource});

  @override
  Future<Either<Failure, List<TranslationEntity>>> loadFlashCards({
    required int limit,
    required String order,
  }) async {
    final url = Uri.parse("${AppEnvironment().baseUrl}/translate/all/limit");

    try {
      final token = await authLocalDataSource.getJwt();
      if (token == null) {
        return left(Failure("No autenticado. Inicia sesión de nuevo"));
      }

      final response = await http.get(
        url.replace(queryParameters: {"limit": "$limit", "order": order}),
        headers: {"Content-Type": "application/json", "x-token": token},
      );

      final data = jsonDecode(response.body);

      if (response.statusCode != 200) {
        throw ServerException(data['message'] ?? "Error al obtener cards");
      }

      final translations =
          (data['data'] as List)
              .map((e) => TranslationModel.fromJson(e).toEntity())
              .toList();
      return Right(translations);
    } catch (e) {
      debugPrint("Error onteniendo traducciones: $e");
      if (e is ServerException) {
        debugPrint("Error onteniendo traducciones: ${e.message}");
        return left(Failure(e.message));
      }
      return left(Failure("No se pudo obtener los cards"));
    }
  }

  @override
  Future<Either<Failure, FlashcardSessionEntity>> createFlashCardSession({
    required int activityId,
  }) async {
    final url = Uri.parse(
      "${AppEnvironment().baseUrl}/courseActivity/$activityId/flashcard/session",
    );

    try {
      final token = await authLocalDataSource.getJwt();
      if (token == null) {
        return left(Failure("No autenticado. Inicia sesión de nuevo"));
      }

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json", "x-token": token},
      );

      final data = jsonDecode(response.body);

      if (response.statusCode != 201) {
        throw ServerException(data['message'] ?? "Error al crear sesión");
      }

      final session = FlashcardSession.fromJson(data['data']['newSession']);
      return Right(session.toEntity());
    } catch (e) {
      debugPrint("Error al crear sesion: $e");
      if (e is ServerException) {
        debugPrint("Error al crear sesion: ${e.message}");
        return left(Failure(e.message));
      }
      return left(Failure("No se pudo cargar esta actividad"));
    }
  }

  @override
  Future<Either<Failure, FlashcardSessionEntity>> completeFlashCardSession({
    required int sessionId,
  }) async {
    final url = Uri.parse(
      "${AppEnvironment().baseUrl}/courseActivity/flashcard/$sessionId/complete",
    );

    try {
      final token = await authLocalDataSource.getJwt();
      if (token == null) {
        return left(Failure("No autenticado. Inicia sesión de nuevo"));
      }

      final response = await http.put(
        url,
        headers: {"Content-Type": "application/json", "x-token": token},
      );

      final data = jsonDecode(response.body);

      if (response.statusCode != 200) {
        throw ServerException(data['message'] ?? "Error al completar sesión");
      }

      final session = FlashcardSession.fromJson(data['data']['updatedSession']);
      return Right(session.toEntity());
    } catch (e) {
      debugPrint("Error al completar sesion: $e");
      if (e is ServerException) {
        debugPrint("Error al completar sesion: ${e.message}");
        return left(Failure(e.message));
      }
      return left(Failure("No se pudo guardar esta sesión"));
    }
  }

  @override
  Future<Either<Failure, FlashcardAttemptEntity>> createFlashCardAttempt({
    required int sessionId,
    required int userTranslationId,
    required String userAnswer,
    required int timeSpentSec,
    required bool isCorrect,
  }) async {
    final url = Uri.parse(
      "${AppEnvironment().baseUrl}/courseActivity/flashcard/$sessionId/attempt",
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
          "userTranslationId": userTranslationId,
          "userAnswer": userAnswer,
          "timeSpentSec": timeSpentSec,
          "isCorrect": isCorrect,
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode != 201) {
        throw ServerException(data['message'] ?? "Error al guardar el intento");
      }

      final attempt = FlashcardAttempt.fromJson(data['data']['attempt']);
      return Right(attempt.toEntity());
    } catch (e) {
      debugPrint("Error al crear el intento: $e");
      if (e is ServerException) {
        debugPrint("Error al crear el intento: ${e.message}");
        return left(Failure(e.message));
      }
      return left(Failure("No se pudo guardar este intento"));
    }
  }

  @override
  Future<Either<Failure, FlashCardEntity>> createFlashCardActivity({
    required int courseId,
    required String title,
    required String description,
    required String dueDate,
    required bool hasScoring,
    required int maxScore,
    required int maxCards,
    required String cardOrder,
  }) async {
    final url = Uri.parse(
      "${AppEnvironment().baseUrl}/courseActivity/$courseId/flashcards",
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
          "title": title,
          "description": description,
          "dueDate": dueDate,
          "hasScoring": hasScoring,
          "maxScore": maxScore,
          "maxCards": maxCards,
          "cardOrder": cardOrder,
        }),
      );

      final data = jsonDecode(response.body);
      print('data: ${data}');

      if (response.statusCode != 201) {
        throw ServerException(data['message'] ?? "Error al crear actividad");
      }

      final flashCard = ActivityModel.fromJson(data['data']);
      return Right(flashCard.toFlashCardEntity()!);
    } catch (e) {
      debugPrint("Error al crear actividad: $e");
      if (e is ServerException) {
        debugPrint("Error al crear actividad: ${e.message}");
        return left(Failure(e.message));
      }
      return left(Failure("No se pudo crear la actividad"));
    }
  }

  @override
  Future<Either<Failure, FlashCardEntity>> updateFlashCardActivity({
    required int activityId,
    required String title,
    required String description,
    required DateTime dueDate,
    required int maxCards,
  }) async {
    final url = Uri.parse(
      "${AppEnvironment().baseUrl}/courseActivity/$activityId/flashcards",
    );

    try {
      final token = await authLocalDataSource.getJwt();
      if (token == null) {
        return left(Failure("No autenticado. Inicia sesión de nuevo"));
      }

      final response = await http.put(
        url,
        headers: {"Content-Type": "application/json", "x-token": token},
        body: jsonEncode({
          "title": title,
          "description": description,
          "dueDate": dueDate.toIso8601String(),
          "maxCards": maxCards,
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode != 200) {
        throw ServerException(
          data['message'] ?? "Error al actualizar actividad",
        );
      }

      final flashCard = ActivityModel.fromJson(data['data']);

      return Right(flashCard.toFlashCardEntity()!);
    } catch (e) {
      debugPrint("Error al actualizar actividad: $e");
      if (e is ServerException) {
        debugPrint("Error al actualizar actividad: ${e.message}");
        return left(Failure(e.message));
      }
      return left(Failure("Error al actualizar actividad"));
    }
  }

  @override
  Future<Either<Failure, String>> deleteFlashCardActivity({
    required int activityId,
  }) async {
    final url = Uri.parse(
      "${AppEnvironment().baseUrl}/courseActivity/$activityId/flashcards",
    );

    try {
      final token = await authLocalDataSource.getJwt();
      if (token == null) {
        return left(Failure("No autenticado. Inicia sesión de nuevo"));
      }

      final response = await http.delete(
        url,
        headers: {"Content-Type": "application/json", "x-token": token},
      );

      final data = jsonDecode(response.body);

      if (response.statusCode != 200) {
        throw ServerException(data['message'] ?? "Error al eliminar actividad");
      }

      final message = data["message"];

      return Right(message);
    } catch (e) {
      debugPrint("Error al eliminar actividad: $e");
      if (e is ServerException) {
        debugPrint("Error al eliminar actividad: ${e.message}");
        return left(Failure(e.message));
      }
      return left(Failure("Error al eliminar actividad"));
    }
  }
}
