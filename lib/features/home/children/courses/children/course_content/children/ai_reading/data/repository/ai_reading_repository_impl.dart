import 'dart:convert';
import 'package:client_app/core/error/failure.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/data/models/feedback/feedback_model.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/data/models/feedback_summary/feedback_summary.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/data/models/feedbak_main_idea/feedback_mainidea.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/domain/entities/feedback_entity.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/domain/entities/feedback_mainidea_entity.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/domain/entities/feedback_summary_entity.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/domain/repository/ai_reading_repository.dart';
import 'package:client_app/shared/datasources/auth_local_datasource.dart';
import 'package:flutter/cupertino.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

import '../../../../../../../../../../core/constants/app_environment.dart';
import '../../../../../../../../../../core/error/server_exception.dart';

class AiReadingRepositoryImpl implements AiReadingRepository {
  final AuthLocalDataSource authLocalDataSource;
  const AiReadingRepositoryImpl({required this.authLocalDataSource});
  @override
  Future<Either<Failure, FeedbackEntity>> evaluateParaphrase({
    required String paragraph,
    required String paraphrase,
  }) async {
    final url = Uri.parse("${AppEnvironment().baseUrl}/ai/evaluate/paraphrase");

    try {
      final token = await authLocalDataSource.getJwt();
      if (token == null) {
        return left(Failure("No autenticado. Inicia sesión de nuevo"));
      }

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json", "x-token": token},
        body: jsonEncode({
          'paragraph': paragraph,
          'userParaphrase': paraphrase,
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode != 200) {
        throw ServerException(data['message'] ?? "Error al evaluar el parrafo");
      }

      final feedbackModel = FeedbackModel.fromJson(data['result']);
      return Right(feedbackModel.toEntity());
    } catch (e) {
      debugPrint("Error evaluating user paraphrase: $e");
      if (e is ServerException) {
        return left(Failure(e.message));
      }
      return left(Failure("No se pudo evaluar el parrafo"));
    }
  }

  @override
  Future<Either<Failure, FeedbackMainIdeaEntity>> evaluateMainIdea({
    required String paragraph,
    required String mainIdea,
  }) async {
    final url = Uri.parse("${AppEnvironment().baseUrl}/ai/evaluate/mainIdea");

    try {
      final token = await authLocalDataSource.getJwt();
      if (token == null) {
        return left(Failure("No autenticado. Inicia sesión de nuevo"));
      }

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json", "x-token": token},
        body: jsonEncode({'paragraph': paragraph, 'userMainIdea': mainIdea}),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode != 200) {
        throw ServerException(data['message'] ?? "Error al evaluar el parrafo");
      }

      final feedbackModel = FeedbackMainIdea.fromJson(data['result']);
      return Right(feedbackModel.toEntity());
    } catch (e) {
      debugPrint("Error evaluating user main idea: $e");
      if (e is ServerException) {
        return left(Failure(e.message));
      }
      return left(Failure("No se pudo evaluar la idea principal"));
    }
  }

  @override
  Future<Either<Failure, FeedbackSummaryEntity>> evaluateSummary({
    required String paragraph,
    required String summary,
  }) async {
    final url = Uri.parse("${AppEnvironment().baseUrl}/ai/evaluate/summary");

    try {
      final token = await authLocalDataSource.getJwt();
      if (token == null) {
        return left(Failure("No autenticado. Inicia sesión de nuevo"));
      }

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json", "x-token": token},
        body: jsonEncode({'paragraph': paragraph, 'userSummary': summary}),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode != 200) {
        throw ServerException(data['message'] ?? "Error al evaluar el parrafo");
      }

      final feedbackModel = FeedbackSummary.fromJson(data['result']);
      return Right(feedbackModel.toEntity());
    } catch (e) {
      debugPrint("Error evaluating user summary: $e");
      if (e is ServerException) {
        return left(Failure(e.message));
      }
      return left(Failure("No se pudo evaluar el resumen"));
    }
  }
}
