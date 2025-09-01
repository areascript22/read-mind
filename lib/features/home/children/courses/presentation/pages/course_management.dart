import 'package:client_app/core/common/utils/toast_util.dart';
import 'package:client_app/features/home/children/courses/domain/entities/course_entity.dart';
import 'package:client_app/features/home/children/courses/presentation/bloc/courses_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/course_tile.dart';
import '../widgets/daily_streak.dart';

class CourseManagementPage extends StatefulWidget {
  const CourseManagementPage({super.key});

  @override
  State<CourseManagementPage> createState() => _CourseManagementPageState();
}

class _CourseManagementPageState extends State<CourseManagementPage> {
  @override
  void initState() {
    super.initState();
    context.read<CoursesBloc>().add(CoursesGetAll());
  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.blue,
                  child: Text(
                    "sharedViewModel.user?.name.substring(0, 2) ?? ''",
                  ),
                ),
                //   Text(sharedViewModel.user?.role.name ?? ''),
              ],
            ),
          ),
        ),
        actions: [
          //Profile picture

          //Icon
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                Text("0", style: TextStyle(fontSize: 17)),
                IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                Text("0", style: TextStyle(fontSize: 17)),
              ],
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1), // height of the line
          child: Container(
            color: Colors.grey.shade300, // line color
            height: 0.5,
          ),
        ),
      ),
      // drawer: DrawerCustom(),
      body: Column(
        children: [
          //PORTRAIT
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            //height: 200,
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
                   // Image.asset('assets/img/notes.png', height: 150),
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
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 27,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          //DAILY STREAK
          DailyStreakWidget(currentStreak: 1, attendance: [true, true, true]),
          //BUILD COURSES
          BlocConsumer<CoursesBloc, CoursesState>(
            builder: (context, state) {

            return CircularProgressIndicator(color: Colors.blue,);
          }, listener: (context, state) {
            if(state is CoursesLoaded){
              ToastMessageUtil.showToast("Loaded", context);
            }
          },)



        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},

        // onPressed: () {
        //   stateManager.courses = [];
        // },
        child: const Icon(Icons.add, color: Colors.blue),
      ),
    );
  }

  //All courses of this preofessor
  Widget _listViewCourses(List<CourseEntity> courses) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context, rootNavigator: true).pushReplacementNamed(
                '/course_content_feature',
                arguments: course,
              );
            },
            child: CourseTile(
              course: course,
              courseId: course.id.toString(),
              title: course.name,
              studentCount: 12,
              imageAssetPath: "",
            ),
          );
        },
      ),
    );
  }

  //Page when there is not courses
  Widget _buildPageWithoutCourses(
    BuildContext context,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Aun no estas incrito en un curso"),
        //Image
        // SizedBox(
        //   height: 200,
        //   child: Image.asset("assets/img/background_1.png"),
        // ),
        //Creat join Classroom
        //const SizedBox(height: 10),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     CustomElevatedButton(
        //       color: Colors.grey[300],
        //       onTap: () async {
        //         //Check if i have permissions
        //         if (sharedVM.user?.role.name == Roles.student) {
        //           //Check if role reqeust is in pending status
        //           await courseVM.checkRequestRoleStatus(context, courseVM);

        //           return;
        //         }
        //         if (context.mounted) {
        //           Navigator.pushNamed(context, "/create_course");
        //         }
        //       },
        //       child: const Text(
        //         "Crear un curso",
        //         style: TextStyle(color: Colors.blue),
        //       ),
        //     ),
        //     const SizedBox(width: 20),
        //     CustomElevatedButton(
        //       onTap: () {
        //         Navigator.pushNamed(context, '/join_course');
        //       },
        //       child: const Text("Unirse a un curso"),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
