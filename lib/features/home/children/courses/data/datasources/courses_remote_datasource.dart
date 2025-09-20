import 'dart:convert';

import 'package:client_app/core/error/server_exception.dart';
import 'package:client_app/features/home/children/courses/data/models/course/course_model.dart';
import 'package:http/http.dart' as http;
import '../../../../../../core/constants/environment.dart';

abstract interface class CoursesRemoteDatasource {
  Future<List<CourseModel>> getAllCourses(String token);

  Future<List<CourseModel>> getAllEnrolledCourses(String token);

  Future<CourseModel> createNewCourse({
    required String token,
    required String title,
    required String description,
  });

  Future<CourseModel> removeCourse({required String token, required int id});

  Future<CourseModel> updateInviteCode({
    required String token,
    required int courseId,
  });

  Future<CourseModel> updateCourseInfo({
    required String token,
    required String courseId,
    required String title,
    required String description,
  });
}

class CoursesRemoteDatasourceImpl implements CoursesRemoteDatasource {
  @override
  Future<List<CourseModel>> getAllCourses(String token) async {
    final url = Uri.parse(Environments.coursesUrl);
    try {
      final response = await http.get(
        url,
        headers: {"Content-Type": "application/json", "x-token": token},
      );
      final data = jsonDecode(response.body);
      final coursesTest = data['course'];
      if (response.statusCode != 200) {
        throw ServerException(data['message']);
      }
      final courseModels =
          (data['course'] as List).map((e) => CourseModel.fromJson(e)).toList();

      return courseModels;
    } catch (e) {
      throw ServerException(
        e is ServerException ? e.message : "No se pudo obtener los cursos",
      );
    }
  }

  @override
  Future<CourseModel> createNewCourse({
    required String token,
    required String title,
    required String description,
  }) async {
    final url = Uri.parse(Environments.coursesUrl);
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json", "x-token": token},
        body: jsonEncode({"name": title, "description": description}),
      );
      final data = jsonDecode(response.body);

      if (response.statusCode != 201) {
        throw ServerException(data['message']);
      }
      final course = data['course'];
      return CourseModel.fromJson(course);
    } catch (e) {
      throw ServerException(
        e is ServerException ? e.message : "No se pudo obtener los cursos",
      );
    }
  }

  @override
  Future<List<CourseModel>> getAllEnrolledCourses(String token) async {
    final url = Uri.parse("${Environments.baseUrl}/courseStudent");
    try {
      final response = await http.get(
        url,
        headers: {"Content-Type": "application/json", "x-token": token},
      );
      final data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw ServerException(data['message']);
      }
      final courseModels =
          (data['courses'] as List)
              .map((e) => CourseModel.fromJson(e))
              .toList();

      return courseModels;
    } catch (e) {
      throw ServerException(
        e is ServerException ? e.message : "No se pudo obtener los cursos",
      );
    }
  }

  @override
  Future<CourseModel> removeCourse({
    required String token,
    required int id,
  }) async {
    final url = Uri.parse("${Environments.coursesUrl}/$id");
    try {
      final response = await http.delete(
        url,
        headers: {"Content-Type": "application/json", "x-token": token},
      );
      final data = jsonDecode(response.body);

      if (response.statusCode != 200) {
        throw ServerException(data['message']);
      }
      final course = data['data'];
      return CourseModel.fromJson(course);
    } catch (e) {
      throw ServerException(e is ServerException ? e.message : e.toString());
    }
  }

  @override
  Future<CourseModel> updateCourseInfo({
    required String token,
    required String courseId,
    required String title,
    required String description,
  }) async {
    final url = Uri.parse("${Environments.coursesUrl}/$courseId");
    try {
      final response = await http.put(
        url,
        headers: {"Content-Type": "application/json", "x-token": token},
        body: jsonEncode({"name": title, "description": description}),
      );
      final data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw ServerException(data['message']);
      }
      return CourseModel.fromJson(data['course']);
    } catch (e) {
      throw ServerException(
        e is ServerException ? e.message : "No se pudo obtener el curso",
      );
    }
  }

  @override
  Future<CourseModel> updateInviteCode({
    required String token,
    required int courseId,
  }) async {
    final url = Uri.parse("${Environments.coursesUrl}/$courseId/invite-code");
    try {
      final response = await http.patch(
        url,
        headers: {"Content-Type": "application/json", "x-token": token},
      );
      final data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw ServerException(data['message']);
      }
      return CourseModel.fromJson(data['course']);
    } catch (e) {
      throw ServerException(
        e is ServerException
            ? e.message
            : "No se pudo actualizar el código de invitación",
      );
    }
  }
}
