import 'package:client_app/core/common/entities/user_entity.dart';
import 'package:client_app/core/routing/route_names.dart';
import 'package:client_app/features/home/children/courses/children/course_content/presentation/bloc/students/students_bloc.dart';
import 'package:client_app/features/home/children/courses/children/student_tracking/presentation/pages/student_tracking.dart';
import 'package:client_app/features/home/children/courses/domain/entities/course_entity.dart';
import 'package:client_app/features/home/children/courses/domain/entities/student_tracking_info_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
    final bloc = context.read<StudentsBloc>();
    bloc.add(EventGetProfessor(widget.courseEntity.teacherId));
    bloc.add(EventLoadAllStudents(widget.courseEntity.id));
  }

  String _getFirstWords(String text, [int n = 2]) {
    if (text.length < n) return text;
    return text.substring(0, n);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 20),
        child: BlocConsumer<StudentsBloc, StudentsState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state.isLoading &&
                state.professor == null &&
                state.students.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (state.professor != null)
                  _buildProfessorSection(state.professor!),
                if (state.students.isNotEmpty)
                  _buildStudents(state.students)
                else if (!state.isLoading)
                  const Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Center(
                      child: Text('No hay estudiantes matriculados'),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildProfessorSection(UserEntity userEntity) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Profesor", style: Theme.of(context).textTheme.titleLarge),
        const Divider(),
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
                style: const TextStyle(fontSize: 24),
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
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildStudents(List<UserEntity> students) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Estudiantes", style: Theme.of(context).textTheme.titleLarge),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                final student = students[index];
                final studentTrackingInfo = StudentTrackingInfoEntity(
                  user: student,
                  course: widget.courseEntity,
                );
                return GestureDetector(
                  onTap: () {
                    context.push(
                      RouteNames.studentTracking,
                      extra: studentTrackingInfo,
                    );
                  },
                  child: Card(
                    elevation: 1,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(_getFirstWords(student.name)),
                      ),
                      title: Text(student.name),
                      subtitle: Text(student.email),
                    ),
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
