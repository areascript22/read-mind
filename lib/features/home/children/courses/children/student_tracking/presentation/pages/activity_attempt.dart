// activity_attempts_page.dart
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ActivityAttemptsPage extends StatefulWidget {
  const ActivityAttemptsPage({super.key});

  @override
  State<ActivityAttemptsPage> createState() => _ActivityAttemptsPageState();
}

class _ActivityAttemptsPageState extends State<ActivityAttemptsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          "Activity Progress",
          style: TextStyle(color: Colors.black87),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.blueAccent,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.blueAccent,
          tabs: const [
            Tab(text: "AI Reading"),
            Tab(text: "Paraphrase"),
            Tab(text: "Main Idea"),
            Tab(text: "Summary"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          _AIReadingTab(),
          _ScoreBasedTab(type: "Paraphrase"),
          _ScoreBasedTab(type: "Main Idea"),
          _ScoreBasedTab(type: "Summary"),
        ],
      ),
    );
  }
}

// 🟦 AI READING SECTION
class _AIReadingTab extends StatelessWidget {
  const _AIReadingTab();

  @override
  Widget build(BuildContext context) {
    // Typed mock data
    final List<Map<String, dynamic>> aiReadingAttempts = [
      {"playCount": 3, "timeSinceEnterSec": 120, "createdAt": "2025-11-03"},
      {"playCount": 4, "timeSinceEnterSec": 95, "createdAt": "2025-11-04"},
      {"playCount": 2, "timeSinceEnterSec": 160, "createdAt": "2025-11-05"},
    ];

    // Create a typed List<double> for the chart (cast safely)
    final List<double> playCounts =
        aiReadingAttempts
            .map((a) => (a['playCount'] as num? ?? 0).toDouble())
            .toList();

    return _ChartAndListLayout(
      title: "AI Reading Engagement",
      chart: _buildLineChartFromDoubleList(playCounts),
      attempts: aiReadingAttempts.map((a) => _AIReadingAttemptCard(a)).toList(),
    );
  }

  Widget _buildLineChartFromDoubleList(List<double> data) {
    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: false),
        titlesData: const FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            color: Colors.blueAccent,
            spots: List.generate(
              data.length,
              (i) => FlSpot(i.toDouble(), data[i]),
            ),
            dotData: const FlDotData(show: true),
            belowBarData: BarAreaData(
              show: true,
              color: Colors.blueAccent.withOpacity(0.2),
            ),
          ),
        ],
      ),
    );
  }
}

// 🟢 SCORE-BASED SECTIONS (Paraphrase, Main Idea, Summary)
class _ScoreBasedTab extends StatelessWidget {
  final String type;
  const _ScoreBasedTab({required this.type});

  @override
  Widget build(BuildContext context) {
    // Typed mock attempts
    final List<Map<String, dynamic>> attempts = [
      {
        "accuracyScore": 80,
        "coverageScore": 75,
        "clarityScore": 88,
        "feedback": "Good effort!",
        "createdAt": "2025-11-03",
      },
      {
        "accuracyScore": 90,
        "coverageScore": 85,
        "clarityScore": 92,
        "feedback": "Excellent!",
        "createdAt": "2025-11-04",
      },
      {
        "accuracyScore": 70,
        "coverageScore": 65,
        "clarityScore": 72,
        "feedback": "Needs improvement.",
        "createdAt": "2025-11-05",
      },
    ];

    // Convert each metric list to List<double>
    final List<double> accuracy =
        attempts
            .map((a) => (a['accuracyScore'] as num? ?? 0).toDouble())
            .toList();
    final List<double> coverage =
        attempts
            .map((a) => (a['coverageScore'] as num? ?? 0).toDouble())
            .toList();
    final List<double> clarity =
        attempts
            .map((a) => (a['clarityScore'] as num? ?? 0).toDouble())
            .toList();

    return _ChartAndListLayout(
      title: "$type Performance",
      chart: _buildLineChartForScores(accuracy, coverage, clarity),
      attempts: attempts.map((a) => _ScoreAttemptCard(a)).toList(),
    );
  }

  Widget _buildLineChartForScores(
    List<double> accuracy,
    List<double> coverage,
    List<double> clarity,
  ) {
    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: false),
        titlesData: const FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          _line("Accuracy", Colors.blue, accuracy),
          _line("Coverage", Colors.green, coverage),
          _line("Clarity", Colors.orange, clarity),
        ],
      ),
    );
  }

  LineChartBarData _line(String name, Color color, List<double> values) {
    return LineChartBarData(
      isCurved: true,
      color: color,
      spots: List.generate(
        values.length,
        (i) => FlSpot(i.toDouble(), values[i]),
      ),
      dotData: const FlDotData(show: true),
      belowBarData: BarAreaData(show: true, color: color.withOpacity(0.15)),
    );
  }
}

// 🧱 COMMON LAYOUT WRAPPER
class _ChartAndListLayout extends StatelessWidget {
  final String title;
  final Widget chart;
  final List<Widget> attempts;

  const _ChartAndListLayout({
    required this.title,
    required this.chart,
    required this.attempts,
  });

  @override
  Widget build(BuildContext context) {
    // Use ListView so each tab is scrollable independently
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        SizedBox(height: 200, child: chart),
        const SizedBox(height: 24),
        ...attempts,
      ],
    );
  }
}

// 🟣 Attempt Cards
class _AIReadingAttemptCard extends StatelessWidget {
  final Map<String, dynamic> attempt;
  const _AIReadingAttemptCard(this.attempt);

  @override
  Widget build(BuildContext context) {
    final playCount = (attempt['playCount'] as num? ?? 0).toString();
    final timeSec = (attempt['timeSinceEnterSec'] as num? ?? 0).toString();
    final date = attempt['createdAt']?.toString() ?? '';

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Attempt on $date",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _metric("Play Count", playCount),
                _metric("Time Spent", "$timeSec sec"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _metric(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}

class _ScoreAttemptCard extends StatelessWidget {
  final Map<String, dynamic> attempt;
  const _ScoreAttemptCard(this.attempt);

  @override
  Widget build(BuildContext context) {
    final date = attempt['createdAt']?.toString() ?? '';
    final accuracy = (attempt['accuracyScore'] as num? ?? 0).toString();
    final coverage = (attempt['coverageScore'] as num? ?? 0).toString();
    final clarity = (attempt['clarityScore'] as num? ?? 0).toString();
    final feedback = attempt['feedback']?.toString() ?? '';

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Attempt on $date",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _pill("Accuracy", accuracy),
                _pill("Coverage", coverage),
                _pill("Clarity", clarity),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              "Feedback: $feedback",
              style: const TextStyle(color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }

  Widget _pill(String label, String value) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.blueAccent.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            "$value%",
            style: const TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}
