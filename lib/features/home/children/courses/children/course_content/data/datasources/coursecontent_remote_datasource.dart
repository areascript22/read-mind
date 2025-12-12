import 'dart:convert';
import 'package:client_app/core/constants/app_environment.dart';
import 'package:client_app/features/auth/data/models/user_model/user_model.dart';
import 'package:client_app/features/home/children/courses/children/course_content/data/models/activity_model/activity_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../../../../../../core/error/server_exception.dart';

abstract interface class CourseContentRemoteDataSource {
  Future<List<UserModel>> getAllStudents({
    required String token,
    required String courseId,
  });

  Future<String> generateParagraph({
    required String token,
    required String topic,
    required String length,
    required String complexity,
    required String style,
  });

  Future<ActivityModel> createAIReading({
    required String token,
    required String courseId,
    required String title,
    required String description,
    required String content,
    required String dueDate,
    required String length,
    required String complexity,
    required String style,
  });

  Future<List<ActivityModel>> getAllActivities({
    required String token,
    required String courseId,
  });

  Future<UserModel> getUser({required String token, required int id});
}

class CourseContentRemoteDataSourceImpl
    implements CourseContentRemoteDataSource {
  @override
  Future<List<UserModel>> getAllStudents({
    required String token,
    required String courseId,
  }) async {
    final url = Uri.parse(
      "${AppEnvironment().baseUrl}/courseStudent/$courseId/students",
    );
    try {
      final response = await http.get(
        url,
        headers: {"Content-Type": "application/json", "x-token": token},
      );
      final data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw ServerException(data['message']);
      }
      final students = data['students'] as List;
      if (students.isEmpty) {
        throw ServerException("Aun no hay estudiantes inscritos");
      }
      final userModels = (students.map((e) => UserModel.fromJson(e)).toList());

      return userModels;
    } catch (e) {
      throw ServerException(
        e is ServerException ? e.message : "Estudiantes no disponibles",
      );
    }
  }

  @override
  Future<String> generateParagraph({
    required String token,
    required String topic,
    required String length,
    required String complexity,
    required String style,
  }) async {
    try {
      await Future.delayed(Duration(seconds: 3));
      final url = Uri.parse("${AppEnvironment().baseUrl}/ai/paragraph");

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json", "x-token": token},
        body: jsonEncode({
          "topic": topic,
          "length": length,
          "complexity": complexity,
          "style": style,
          "environment": "prod",
        }),
      );
      final data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw ServerException(data['message']);
      }

      return data['paragraph'];
    } catch (e) {
      debugPrint("Error generating paragraph: $e");
      throw ServerException(
        e is ServerException ? e.message : "Servicio no disponible",
      );
    }
  }

  @override
  Future<ActivityModel> createAIReading({
    required String token,
    required String courseId,
    required String title,
    required String description,
    required String content,
    required String dueDate,
    required String length,
    required String complexity,
    required String style,
  }) async {
    try {
      final url = Uri.parse(
        "${AppEnvironment().baseUrl}/courseActivity/$courseId/aiReading",
      );

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json", "x-token": token},
        body: jsonEncode({
          "title": title,
          "description": description,
          "content": content,
          "dueDate": dueDate,
          "length": length,
          "complexity": complexity,
          "style": style,
          "hasScoring": true,
          "maxScore": 100,
        }),
      );
      final data = jsonDecode(response.body);
      if (response.statusCode != 201) {
        throw ServerException(data['message']);
      }

      return ActivityModel.fromJson(data['data']);
    } catch (e) {
      debugPrint("Error saving ai reading: $e");
      throw ServerException(
        e is ServerException ? e.message : "Servicio no disponible",
      );
    }
  }

  @override
  Future<List<ActivityModel>> getAllActivities({
    required String token,
    required String courseId,
  }) async {
    try {
      final url = Uri.parse(
        "${AppEnvironment().baseUrl}/courseActivity/$courseId/getAllAiReadings",
      );

      final response = await http.get(
        url,
        headers: {"Content-Type": "application/json", "x-token": token},
      );
      final data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw ServerException(data['message'] ?? 'Servicio no disponible');
      }

      return (data['data'] as List)
          .map((e) => ActivityModel.fromJson(e))
          .toList();
    } catch (e) {
      debugPrint("Error getting all activities: $e");
      throw ServerException(
        e is ServerException ? e.message : "Servicio no disponible",
      );
    }
  }

  @override
  Future<UserModel> getUser({required String token, required int id}) async {
    try {
      final url = Uri.parse("${AppEnvironment().baseUrl}/user/$id");

      final response = await http.get(
        url,
        headers: {"Content-Type": "application/json", "x-token": token},
      );
      final data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw ServerException(data['message'] ?? 'Servicio no disponible');
      }

      return UserModel.fromJson(data['data']);
    } catch (e) {
      debugPrint("Error getting user info for id: $id, error: $e");
      throw ServerException(
        e is ServerException ? e.message : "Servicio no disponible",
      );
    }
  }
}
