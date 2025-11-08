import 'package:client_app/core/common/entities/user_entity.dart';
import 'package:client_app/features/home/children/courses/children/student_tracking/domian/entity/progress_entity.dart';
import 'package:client_app/features/home/children/courses/children/student_tracking/presentation/pages/activity_attempt.dart';
import 'package:client_app/features/home/children/courses/children/student_tracking/presentation/widgets/score_chart.dart';
import 'package:client_app/features/home/children/courses/domain/entities/course_entity.dart';
import 'package:client_app/features/home/children/courses/domain/entities/student_tracking_info_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../../init_dependencies.dart';
import '../bloc/progress_bloc/progress_bloc.dart';

class StudentTrackingPage extends StatelessWidget {
  final StudentTrackingInfoEntity info;
  const StudentTrackingPage({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: serviceLocator<ProgressBloc>(),
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
    print("INIT student tracking");

    context.read<ProgressBloc>().add(
      LoadProgressEvent(userId: widget.info.user.id),
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
            /// HEADER - Sin cambios
            _StudentHeader(
              student: widget.info.user,
              course: widget.info.course,
              progress: 100,
            ),

            const SizedBox(height: 24),

            /// CONTENIDO PRINCIPAL CON BLOC CONSUMER
            BlocConsumer<ProgressBloc, ProgressState>(
              listener: (context, state) {
                // Mostrar Toast si hay error
                if (state is ProgressError) {
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
                // Estados de carga y error
                if (state is ProgressLoading) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 32.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                if (state is ProgressError) {
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
                              context.read<ProgressBloc>().add(
                                LoadProgressEvent(userId: widget.info.user.id),
                              );
                            },
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                // Estado cargado - construir contenido con datos reales
                if (state is ProgressLoaded) {
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

                      SizedBox(height: 370, child: ScoreChartWidget()),

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

                      // Lista de actividades
                      ...trackingData.progresses.map(
                        (progress) => _ActivityTile(activity: progress),
                      ),
                    ],
                  );
                }

                // Estado inicial - mostrar placeholder
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _SummaryCards(total: 0, completed: 0, avgScore: 0),
                    const SizedBox(height: 32),
                    SizedBox(height: 370, child: ScoreChartWidget()),
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
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _StudentHeader extends StatelessWidget {
  final UserEntity student;
  final CourseEntity course;
  final double progress;
  const _StudentHeader({
    required this.student,
    required this.course,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(blurRadius: 6, color: Colors.black12)],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 36,
            backgroundImage: NetworkImage(
              'https://avatars.githubusercontent.com/u/9919?s=200&v=4',
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  student.name,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  student.email,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  course.name,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 12),
                LinearProgressIndicator(
                  value: progress,
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.green,
                  backgroundColor: Colors.grey[200],
                ),
                const SizedBox(height: 4),
                Text(
                  "${(progress * 100).toStringAsFixed(1)}% completed",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
          color: color.withOpacity(0.1),
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
                color: color.withOpacity(0.9),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActivityTile extends StatelessWidget {
  final ProgressEntity activity;
  const _ActivityTile({required this.activity});

  @override
  Widget build(BuildContext context) {
    final completed = activity.completed;
    final color = completed ? Colors.green : Colors.grey[400];
    final score = activity.totalScore;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ActivityAttemptsPage()),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadow(blurRadius: 4, color: Colors.black12)],
        ),
        child: ListTile(
          title: Text(
            activity.title,
            style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            completed ? "Completed - Score: $score%" : "Not completed",
            style: GoogleFonts.poppins(
              color: completed ? Colors.green : Colors.redAccent,
            ),
          ),
          trailing: Icon(
            completed ? Icons.check_circle : Icons.hourglass_bottom,
            color: color,
          ),
        ),
      ),
    );
  }
}
