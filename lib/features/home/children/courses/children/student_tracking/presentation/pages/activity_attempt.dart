import 'package:client_app/features/home/children/courses/children/student_tracking/presentation/bloc/progress_bloc/tracking_bloc.dart';
import 'package:client_app/features/home/children/courses/children/student_tracking/presentation/pages/paraphrase_attempt_page.dart';
import 'package:client_app/features/home/children/courses/children/student_tracking/presentation/pages/summary_attempt_page.dart';
import 'package:client_app/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'mianidea_attempt_page.dart';

class ActivityAttemptsPage extends StatelessWidget {
  final int aiReadingId;
  const ActivityAttemptsPage({super.key, required this.aiReadingId});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFFF9FAFB),

        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black87),
          title: const Text('Activity Attempts'),
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
        ),
        body: BlocProvider.value(
          value: serviceLocator<TrackingBloc>(),
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              ParaphraseAttemptsPage(aiReadingId: aiReadingId),
              MainIdeaAttemptsPage(aiReadingId: aiReadingId),
              SummaryAttemptsPage(aiReadingId: aiReadingId),
            ],
          ),
        ),
      ),
    );
  }
}
