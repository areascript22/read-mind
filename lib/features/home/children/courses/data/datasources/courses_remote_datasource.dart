import 'dart:convert';

import 'package:client_app/core/error/server_exception.dart';
import 'package:client_app/features/home/children/courses/data/models/course/course_model.dart';
import 'package:http/http.dart' as http;

import '../../../../../../core/constants/environment.dart';

abstract interface class CoursesRemoteDatasource{
Future<List<CourseModel>> getAllCourses(String token);
}

class CoursesRemoteDatasourceImpl implements CoursesRemoteDatasource{
  @override
  Future<List<CourseModel>> getAllCourses(String token) async {
    final url = Uri.parse(Environments.coursesUrl);
    try {
      final response = await http.get(
        url,
        headers: {"Content-Type": "application/json", "x-token": token},
      );
      final data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw ServerException(data['message']);
      }
      final courseModels = (data['course'] as List).map((e)=> CourseModel.fromJson(e)).toList();

      return courseModels;
    } catch (e) {
      throw ServerException(e is ServerException? e.message: "No se pudo obtener los cursos");
    }
  }


}