import 'dart:convert';

import 'package:client_app/core/error/failure.dart';
import 'package:client_app/features/home/children/vocabulary/domain/repository/vocabulary_repository.dart';
import 'package:client_app/features/home/domain/entity/translation_entity.dart';
import 'package:client_app/shared/datasources/auth_local_datasource.dart';
import 'package:flutter/cupertino.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

import '../../../../../../core/constants/app_environment.dart';
import '../../../../../../core/error/server_exception.dart';
import '../../../../data/model/translation_model/translation_model.dart';

class VocabularyRepositoryImpl implements VocabularyRepository {
  final AuthLocalDataSource authLocalDataSource;

  const VocabularyRepositoryImpl({required this.authLocalDataSource});

  @override
  Future<Either<Failure, List<TranslationEntity>>> getAllTranslations() async {
    final url = Uri.parse("${AppEnvironment().baseUrl}/translate/all");

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
        throw ServerException(
          data['message'] ?? "No se pudo obtener sus traducciones",
        );
      }

      final translationsModel =
          (data['translations'] as List)
              .map((e) => TranslationModel.fromJson(e))
              .toList();
      return Right(translationsModel.map((e) => e.toEntity()).toList());
    } catch (e) {
      debugPrint("Error getting all translations: $e");
      if (e is ServerException) {
        return left(Failure(e.message));
      }
      return left(Failure("No se pudo obtener las traducciones"));
    }
  }
}
