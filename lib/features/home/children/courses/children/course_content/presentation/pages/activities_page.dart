import 'package:client_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:client_app/core/common/entities/user_entity.dart';
import 'package:client_app/core/routing/route_names.dart';
import 'package:client_app/features/home/children/courses/children/course_content/data/models/activity_model/activity_model.dart';
import 'package:client_app/features/home/children/courses/children/course_content/presentation/bloc/course_content/course_content_bloc.dart';
import 'package:client_app/features/home/children/courses/children/course_content/presentation/widgets/activity_tile.dart';
import 'package:client_app/features/home/children/courses/domain/entities/course_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../../../../../shared/widgets/loader_indicator.dart';
import '../widgets/bottom_sheet_create_content.dart';

class ActivitiesPage extends StatefulWidget {
  final CourseEntity course;
  const ActivitiesPage({super.key, required this.course});

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  RefreshController refreshController = RefreshController();
  bool courseOwner = false;
  late UserEntity? user;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<CourseContentBloc>().add(
        EventGetAllActivities(widget.course.id.toString()),
      );
    });
    user = context.read<AppUserCubit>().user;
    courseOwner = user != null && user!.id == widget.course.id;
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userBloc = context.read<AppUserCubit>();
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<CourseContentBloc, CourseContentState>(
              listener: (context, state) {
                if (state is CourseContentActivitiesLoaded) {
                  refreshController.refreshCompleted();
                } else if (state is CourseContentError) {
                  refreshController.refreshFailed();
                }
              },
              builder: (context, state) {
                return SmartRefresher(
                  controller: refreshController,
                  enablePullDown: true,
                  onRefresh: () {
                    context.read<CourseContentBloc>().add(
                      EventGetAllActivities(widget.course.id.toString()),
                    );
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
      floatingActionButton:
          courseOwner || userBloc.isAdmin || userBloc.isSuperUser
              ? FloatingActionButton(
                onPressed: () {
                  showBottomSheetCreateResource(context);
                },
                child: const Icon(Icons.add),
              )
              : null,
    );
  }

  Widget _buildContentByState(CourseContentState state) {
    if (state is CourseContentActivitiesLoaded) {
      return _listViewCourses(state.activities);
    }

    if (state is CourseContentError &&
        state.actions == CCActions.getAllActivities) {
      return Center(
        child: Text(state.message, style: const TextStyle(color: Colors.red)),
      );
    }

    if (state is CourseContentLoading &&
        state.actions == CCActions.getAllActivities) {
      return const LoaderIndicator();
    }

    return const SizedBox.shrink();
  }

  Widget _listViewCourses(List<ActivityModel> activities) {
    if (activities.isEmpty) {
      return Center(child: Text("No hay actividades disponibles"));
    }
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: activities.length,
      itemBuilder: (context, index) {
        final activity = activities[index];
        return GestureDetector(
          onTap: () {
            context.push(RouteNames.activityAIReading, extra: activity);
          },
          child: ActivityTile(activity: activity),
        );
      },
    );
  }
}
