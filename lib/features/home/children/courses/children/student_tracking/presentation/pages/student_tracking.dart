import 'package:client_app/core/common/entities/user_entity.dart';
import 'package:client_app/features/home/children/courses/children/student_tracking/presentation/pages/activity_attempt.dart';
import 'package:client_app/features/home/children/courses/children/student_tracking/presentation/widgets/score_chart.dart';
import 'package:client_app/features/home/children/courses/domain/entities/course_entity.dart';
import 'package:client_app/features/home/children/courses/domain/entities/student_tracking_info_entity.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentTrackingPage extends StatelessWidget {
  final StudentTrackingInfoEntity info;
  const StudentTrackingPage({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    final activityProgress = [
      {'title': 'Reading 1', 'score': 80, 'completed': true},
      {'title': 'Reading 2', 'score': 70, 'completed': true},
      {'title': 'Reading 3', 'score': 90, 'completed': true},
    ];

    final completed =
        activityProgress.where((a) => a['completed'] == true).length;
    final avgScore =
        activityProgress
            .where((a) => (a['score'] as int) > 0)
            .fold<double>(0, (prev, a) => prev + (a['score'] as int)) /
        (completed == 0 ? 1 : completed);

    //final progressPercent = completed / course['activitiesCount']!;
    final progressPercent = completed / 1;

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
            /// HEADER
            _StudentHeader(
              student: info.user,
              course: info.course,
              progress: progressPercent,
            ),

            const SizedBox(height: 24),

            /// SUMMARY CARDS
            _SummaryCards(total: 2, completed: completed, avgScore: avgScore),

            const SizedBox(height: 32),

            const SizedBox(height: 16),
            SizedBox(height: 370, child: ScoreChartWidget()),

            const SizedBox(height: 32),

            /// ACTIVITY LIST
            Text(
              "Activity Details",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            ...activityProgress.map((a) => _ActivityTile(activity: a)).toList(),
          ],
        ),
      ),
    );
  }
}

/// HEADER WIDGET
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

/// CHART WIDGET
class _ProgressChart extends StatelessWidget {
  final List<Map<String, dynamic>> activityProgress;
  const _ProgressChart({required this.activityProgress});

  @override
  Widget build(BuildContext context) {
    final spots =
        activityProgress.asMap().entries.map((e) {
          final index = e.key.toDouble();
          final score = (e.value['score'] as num).toDouble();
          return FlSpot(index, score);
        }).toList();

    return LineChart(
      LineChartData(
        minY: 0,
        maxY: 100,
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          leftTitles: const AxisTitles(),
          rightTitles: const AxisTitles(),
          topTitles: const AxisTitles(),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: (value, meta) {
                final idx = value.toInt();
                if (idx >= 0 && idx < activityProgress.length) {
                  return Text(
                    'A${idx + 1}',
                    style: GoogleFonts.poppins(fontSize: 12),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            color: Colors.green,
            isCurved: true,
            barWidth: 3,
            belowBarData: BarAreaData(
              show: true,
              color: Colors.green.withOpacity(0.15),
            ),
            dotData: const FlDotData(show: true),
          ),
        ],
      ),
    );
  }
}

/// ACTIVITY TILE
class _ActivityTile extends StatelessWidget {
  final Map<String, dynamic> activity;
  const _ActivityTile({required this.activity});

  @override
  Widget build(BuildContext context) {
    final completed = activity['completed'] as bool;
    final color = completed ? Colors.green : Colors.grey[400];
    final score = activity['score'] as int;

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
            activity['title'],
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
