import 'package:client_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:client_app/core/common/entities/user_entity.dart';
import 'package:client_app/core/common/utils/toast_util.dart';
import 'package:client_app/features/home/children/courses/children/course_content/presentation/bloc/course_content_bloc.dart';
import 'package:client_app/features/home/children/courses/domain/entities/course_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentsPage extends StatefulWidget {
  final CourseEntity courseEntity;
  const StudentsPage({super.key, required this.courseEntity});

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  @override
  void initState() {
    super.initState();
    context.read<CourseContentBloc>().add(
      EventGetAllStudents(widget.courseEntity.id.toString()),
    );
  }

  String _getFirstWords(String text, [int n = 2]) {
    if (text.length < n) return text;
    return text.substring(0, n);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10).copyWith(top: 20),
        child: Column(
          children: [
            BlocConsumer<AppUserCubit, AppUserState>(
              builder: (context, state) {
                if (state is AppUserLoggedIn) {
                  return _buildProfessorSection(state.userEntity);
                }
                return SizedBox.shrink();
              },
              listener: (context, state) {},
            ),

            BlocConsumer<CourseContentBloc, CourseContentState>(
              builder: (context, state) {
                if (state is CourseContentStudentsLoaded) {
                  final items = state.students;
                  return _buildStudents(items);
                }

                if (state is CourseContentError) {
                  return Center(child: Text(state.message));
                }

                return SizedBox.shrink();
              },
              listener: (context, state) {
                if (state is CourseContentError) {
                  // ToastMessageUtil.showToast(state.message, context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfessorSection(UserEntity userEntity) {
    return Column(
      children: [
        Row(
          children: [
            Text("Profesor", style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
        Divider(),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: CircleAvatar(
              radius: 28,
              child: Text(
                _getFirstWords(userEntity.name),
                style: TextStyle(fontSize: 24),
              ),
            ),
            title: Text(
              userEntity.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(userEntity.email),
            trailing: const Icon(Icons.school, color: Colors.blue),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildStudents(List<UserEntity> students) {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Estudiantes",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                final student = students[index];
                return Card(
                  elevation: 1,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(_getFirstWords(student.name)),
                    ),
                    title: Text(student.name),
                    subtitle: Text(student.email),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
