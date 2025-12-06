import 'package:client_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:client_app/core/common/entities/user_entity.dart';
import 'package:client_app/core/routing/route_names.dart';
import 'package:client_app/features/home/children/courses/children/course_content/presentation/bloc/students/students_bloc.dart';
import 'package:client_app/features/home/children/courses/domain/entities/course_entity.dart';
import 'package:client_app/features/home/children/courses/domain/entities/student_tracking_info_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart'; // Importar el paquete

class StudentsPage extends StatefulWidget {
  final CourseEntity courseEntity;
  const StudentsPage({super.key, required this.courseEntity});

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  bool ownCourse = false;
  late AppUserCubit appUserCubit;
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  ); // Controlador para el pull to refresh

  @override
  void initState() {
    super.initState();
    final bloc = context.read<StudentsBloc>();
    bloc.add(EventGetProfessor(widget.courseEntity.teacherId));
    bloc.add(EventLoadAllStudents(widget.courseEntity.id));

    appUserCubit = context.read<AppUserCubit>();
    ownCourse = widget.courseEntity.teacherId == appUserCubit.user?.id;
  }

  String _getFirstWords(String text, [int n = 2]) {
    if (text.length < n) return text;
    return text.substring(0, n);
  }

  // Método para manejar el refresh
  void _onRefresh() {
    context.read<StudentsBloc>().add(
      EventLoadAllStudents(widget.courseEntity.id),
    );
    _refreshController.refreshCompleted(); // Completar el refresh
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 20),
        child: BlocConsumer<StudentsBloc, StudentsState>(
          listener: (context, state) {
            // Opcional: Puedes escuchar cambios en el estado para manejar errores
          },
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
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: Colors.grey.shade300, width: 1.5),
          ),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              leading: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.shade700,
                      Colors.blue.shade500,
                      Colors.blue.shade300,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    _getFirstWords(userEntity.name),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              title: Text(
                userEntity.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.blue,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    userEntity.email,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              trailing: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.school,
                  size: 24,
                  color: Colors.blue.shade800,
                ),
              ),
            ),
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
            // Envolver en SmartRefresher para habilitar pull to refresh
            child: SmartRefresher(
              controller: _refreshController,
              onRefresh: _onRefresh,
              enablePullDown: true,
              enablePullUp: false, // Solo queremos pull down, no pull up
              header: WaterDropHeader(
                complete: Icon(Icons.check, color: Colors.blue[400]),
                waterDropColor: Colors.blue[400]!,
              ),
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  final student = students[index];
                  final studentTrackingInfo = StudentTrackingInfoEntity(
                    user: student,
                    course: widget.courseEntity,
                  );
                  return _buildStudentsTile(
                    context,
                    studentTrackingInfo,
                    student,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStudentsTile(
    BuildContext context,
    StudentTrackingInfoEntity studentTrackingInfo,
    UserEntity student,
  ) {
    return GestureDetector(
      onTap: () {
        if (ownCourse || appUserCubit.isSuperUser || appUserCubit.isAdmin) {
          context.push(RouteNames.studentTracking, extra: studentTrackingInfo);
        }
      },
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.white, Colors.grey.shade50],
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary.withOpacity(0.8),
                    Theme.of(context).colorScheme.secondary.withOpacity(0.8),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  _getFirstWords(student.name),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            title: Text(
              student.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 2),
                Text(
                  student.email,
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            trailing:
                (ownCourse || appUserCubit.isSuperUser || appUserCubit.isAdmin)
                    ? Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).colorScheme.primary.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 16,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    )
                    : null,
            tileColor: Colors.transparent,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _refreshController.dispose(); // Importante: limpiar el controlador
    super.dispose();
  }
}
