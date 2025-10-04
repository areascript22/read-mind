import 'package:client_app/core/routing/route_names.dart';
import 'package:client_app/features/home/children/courses/children/course_content/presentation/cubit/course_cubit.dart';
import 'package:client_app/features/home/children/courses/children/course_content/presentation/pages/students_page.dart';
import 'package:client_app/features/home/children/courses/domain/entities/course_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../shared/widgets/appbar_bottom_line.dart';
import 'activities_page.dart';

class PagesContainer extends StatefulWidget {
  final CourseEntity courseEntity;
  const PagesContainer({super.key, required this.courseEntity});

  @override
  State<PagesContainer> createState() => _PagesContainerState();
}

class _PagesContainerState extends State<PagesContainer> {
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    context.read<CourseCubit>().setCourse(widget.courseEntity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarContainer(
        context,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () => context.go(RouteNames.home),
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                context.push(
                  RouteNames.courseSettings,
                  extra: widget.courseEntity,
                );
              },
              icon: Icon(
                Icons.settings,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                IndexedStack(
                  index: _currentIndex,
                  children: [
                    //NewsPage(),
                    ActivitiesPage(course: widget.courseEntity),
                    StudentsPage(courseEntity: widget.courseEntity),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          if (mounted) {
            setState(() {
              _currentIndex = value;
            });
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.book_online),
            label: 'Actividades',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Estudiantes',
          ),
        ],
      ),
    );
  }
}
