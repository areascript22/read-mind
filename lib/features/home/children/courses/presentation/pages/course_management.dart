import 'package:client_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:client_app/core/routing/route_names.dart';
import 'package:client_app/features/home/children/courses/domain/entities/course_entity.dart';
import 'package:client_app/features/home/children/courses/domain/enums/course_option.dart';
import 'package:client_app/features/home/children/courses/presentation/bloc/courses_bloc/courses_bloc.dart';
import 'package:client_app/features/home/children/courses/presentation/widgets/bottomsheet_create_course.dart';
import 'package:client_app/features/home/children/courses/presentation/widgets/role_course_options.dart';
import 'package:client_app/shared/widgets/loader_indicator.dart';
import 'package:client_app/shared/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../bloc/course_option_cubit/course_option_cubit.dart';
import '../widgets/course_tile.dart';
import '../widgets/daily_streak.dart';

class CourseManagementPage extends StatefulWidget {
  const CourseManagementPage({super.key});

  @override
  State<CourseManagementPage> createState() => _CourseManagementPageState();
}

class _CourseManagementPageState extends State<CourseManagementPage> {
  final RefreshController refreshController = RefreshController();
  bool userIsProfessor = false;

  @override
  void initState() {
    super.initState();
    _fetchAllCourses();
    userIsProfessor = context.read<AppUserCubit>().isProfessor;
  }

  void _fetchAllCourses() {
    if (userIsProfessor) {
      context.read<CoursesBloc>().add(CoursesGetAllEvent());
    }
    context.read<CoursesBloc>().add(CoursesGetAllEnrolledEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 196,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: GestureDetector(onTap: () {}, child: UserAvatar()),
        ),
        actions: [
          GestureDetector(
            child: SvgPicture.asset(
              "assets/images/svg/bell.svg",
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
          SizedBox(width: 10),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1), // height of the line
          child: Container(
            color: Colors.grey.shade300, // line color
            height: 0.5,
          ),
        ),
      ),

      body: Column(
        children: [
          RolCourseOptions(),
          Expanded(
            child: BlocConsumer<CoursesBloc, CoursesState>(
              listener: (context, state) {
                if (state is CoursesLoaded) {
                  refreshController.refreshCompleted();
                } else if (state is CourseFailure) {
                  refreshController.refreshFailed();
                }
              },
              builder: (context, state) {
                return SmartRefresher(
                  controller: refreshController,
                  enablePullDown: true,
                  onRefresh: () {
                    final selectedOption =
                        context.read<CourseOptionCubit>().state;

                    if (selectedOption == CourseOptions.yourCourses) {
                      context.read<CoursesBloc>().add(
                        CoursesGetAllEnrolledEvent(),
                      );
                      return;
                    }

                    context.read<CoursesBloc>().add(CoursesGetAllEvent());
                  },
                  header: WaterDropHeader(
                    complete: Icon(Icons.check, color: Colors.blue[400]),
                    waterDropColor: Colors.blue[400]!,
                  ),
                  child: _buildContentByState(state),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildContentByState(CoursesState state) {
    if (state is CoursesLoaded) {
      return _listViewCourses(state.courses);
    }

    if (state is CourseFailure) {
      return Center(
        child: Text(state.message, style: const TextStyle(color: Colors.red)),
      );
    }

    if (state is CourseLoading && state.courseAction == CourseAction.getAll) {
      return const LoaderIndicator();
    }

    return const SizedBox.shrink();
  }

  Container _buildVocabulary() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Color(0xFFF5F8FD),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  //Percent
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '0',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                        ),
                        TextSpan(
                          text: ' %',

                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Vocabulario",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        showBottomSheetCreateCourse(context);
      },
      child: const Icon(Icons.add),
    );
  }

  Widget _listViewCourses(List<CourseEntity> courses) {
    if (courses.isEmpty) {
      return Center(child: Text("No hay cursos disponibles"));
    }
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final course = courses[index];
        return GestureDetector(
          onTap: () {
            context.go(
              "${RouteNames.courseContent}/${course.id.toString()}",
              extra: course,
            );
          },
          child: CourseTile(course: course),
        );
      },
    );
  }
}
