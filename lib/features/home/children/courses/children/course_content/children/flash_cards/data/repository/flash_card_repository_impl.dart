import 'dart:convert';

import 'package:client_app/core/error/failure.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/flash_cards/domain/repository/flash_card_repository.dart';
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
}
