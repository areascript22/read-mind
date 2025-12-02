import 'package:client_app/core/common/entities/user_entity.dart';
import 'package:client_app/features/home/children/courses/children/student_tracking/presentation/bloc/progress_bloc/tracking_bloc.dart';
import 'package:client_app/features/home/children/courses/children/student_tracking/presentation/pages/paraphrase_attempt_page.dart';
import 'package:client_app/features/home/children/courses/children/student_tracking/presentation/pages/summary_attempt_page.dart';
import 'package:client_app/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'mianidea_attempt_page.dart';

class ActivityAttemptsPage extends StatelessWidget {
  final int aiReadingId;
  final UserEntity userEntity;
  final int courseId;
  const ActivityAttemptsPage({
    super.key,
    required this.aiReadingId,
    required this.userEntity,
    required this.courseId,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFFF9FAFB),
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black87),
          title: Text(
            'Activity Attempts',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          bottom: const TabBar(
            labelColor: Colors.blueAccent,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blueAccent,
            tabs: [
              Tab(text: 'Paraphrase'),
              Tab(text: 'Main Idea'),
              Tab(text: 'Summary'),
            ],
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<TrackingBloc>().add(
                LoadTrackingEvent(userId: userEntity.id, courseId: courseId),
              );
            },
            icon: Icon(Icons.close),
          ),
        ),
        body: BlocProvider.value(
          value: serviceLocator<TrackingBloc>(),
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              ParaphraseAttemptsPage(
                aiReadingId: aiReadingId,
                userEntity: userEntity,
              ),
              MainIdeaAttemptsPage(
                aiReadingId: aiReadingId,
                userEntity: userEntity,
              ),
              SummaryAttemptsPage(
                aiReadingId: aiReadingId,
                userEntity: userEntity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
