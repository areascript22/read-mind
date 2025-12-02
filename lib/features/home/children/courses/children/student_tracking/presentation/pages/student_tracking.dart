import 'package:client_app/features/home/children/courses/domain/entities/student_tracking_info_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../../../init_dependencies.dart';
import '../bloc/progress_bloc/tracking_bloc.dart';
import '../widgets/activity_tracking_tile.dart';
import '../widgets/trackinig_student_header.dart';

class StudentTrackingPage extends StatelessWidget {
  final StudentTrackingInfoEntity info;
  const StudentTrackingPage({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: serviceLocator<TrackingBloc>(),
      child: _StudentTrackingContent(info: info),
    );
  }
}

class _StudentTrackingContent extends StatefulWidget {
  final StudentTrackingInfoEntity info;
  const _StudentTrackingContent({required this.info});

  @override
  State<_StudentTrackingContent> createState() =>
      _StudentTrackingContentState();
}

class _StudentTrackingContentState extends State<_StudentTrackingContent> {
  @override
  void initState() {
    super.initState();
    context.read<TrackingBloc>().add(
      LoadTrackingEvent(
        userId: widget.info.user.id,
        courseId: widget.info.course.id,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Student Progress',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StudentHeader(
              student: widget.info.user,
              course: widget.info.course,
            ),

            const SizedBox(height: 24),

            BlocConsumer<TrackingBloc, TrackingState>(
              listener: (context, state) {
                if (state is TrackingError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      backgroundColor: Colors.red,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is TrackingLoading) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 32.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                if (state is TrackingError) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 32.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 64,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Failed to load progress data',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {
                              context.read<TrackingBloc>().add(
                                LoadTrackingEvent(
                                  userId: widget.info.user.id,
                                  courseId: widget.info.course.id,
                                ),
                              );
                            },
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                if (state is TrackingLoaded) {
                  final trackingData = state.trackingData;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _SummaryCards(
                        total: trackingData.statistics.total,
                        completed: trackingData.statistics.completed,
                        avgScore: trackingData.statistics.averageScore,
                      ),

                      const SizedBox(height: 32),

                      Text(
                        "Activity Details",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),

                      ...trackingData.progresses.map(
                        (progress) => ActivityTrackingTile(
                          activity: progress,
                          userEntity: widget.info.user,
                          courseEntity: widget.info.course,
                        ),
                      ),
                    ],
                  );
                }

                return _buildStatisticsWithNoData();
              },
            ),
          ],
        ),
      ),
    );
  }

  Column _buildStatisticsWithNoData() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SummaryCards(total: 0, completed: 0, avgScore: 0),
        const SizedBox(height: 32),
        const SizedBox(height: 32),
        Text(
          "Activity Details",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 32.0),
            child: Text('Loading progress data...'),
          ),
        ),
      ],
    );
  }
}

class _SummaryCards extends StatelessWidget {
  final int total;
  final int completed;
  final double avgScore;
  const _SummaryCards({
    required this.total,
    required this.completed,
    required this.avgScore,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _StatCard(title: "Total", value: "$total", color: Colors.blueAccent),
        _StatCard(title: "Completed", value: "$completed", color: Colors.green),
        _StatCard(
          title: "Avg. Score",
          value: "${avgScore.toStringAsFixed(1)}%",
          color: Colors.orange,
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  const _StatCard({
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 90,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: color.withValues(alpha: 0.9),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
