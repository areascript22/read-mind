import 'package:client_app/features/home/children/courses/children/student_tracking/domian/entity/progress_entity.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ScoreChartWidget extends StatelessWidget {
  final List<ProgressEntity> studentTracking;
  const ScoreChartWidget({super.key, required this.studentTracking});

  List<Map<String, dynamic>> get _mockProgresses1 => [
    {
      'title': 'Reading Comprehension',
      'totalScore': 85,
      'completed': true,
      'maxScore': 100,
    },
    {
      'title': 'Vocabulary Practice',
      'totalScore': 65,
      'completed': false,
      'maxScore': 100,
    },
    {
      'title': 'Grammar Test',
      'totalScore': 92,
      'completed': true,
      'maxScore': 100,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título del gráfico
            Text(
              'Activity Scores Overview',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[800],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Progress across all activities',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
            ),
            const SizedBox(height: 20),

            // Gráfico de barras
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 100,
                  minY: 0,
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    getDrawingHorizontalLine:
                        (value) =>
                            FlLine(color: Colors.grey[300], strokeWidth: 1),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.grey[400]!, width: 1),
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              'A${value.toInt() + 1}',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            '${value.toInt()}',
                            style: const TextStyle(fontSize: 12),
                          );
                        },
                        reservedSize: 40,
                      ),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  barTouchData: BarTouchData(
                    enabled: true,
                    touchTooltipData: BarTouchTooltipData(
                      tooltipBgColor: Colors.blueGrey[800]!,
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        final activity = studentTracking[groupIndex];
                        return BarTooltipItem(
                          '${activity.title}\n',
                          const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: 'Score: ${activity.totalScore}',
                              style: const TextStyle(
                                color: Colors.yellow,
                                fontSize: 14,
                              ),
                            ),
                            TextSpan(
                              text:
                                  '\nStatus: ${activity.completed ? 'Completed' : 'In Progress'}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  barGroups:
                      studentTracking.asMap().entries.map((entry) {
                        final index = entry.key;
                        final activity = entry.value;

                        return BarChartGroupData(
                          x: index,
                          barRods: [
                            BarChartRodData(
                              toY: activity.totalScore.toDouble(),
                              color:
                                  activity.completed
                                      ? Colors.green[400]!
                                      : Colors.blue[400]!,
                              width: 16,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ],
                        );
                      }).toList(),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Leyenda
            _buildLegend(),
          ],
        ),
      ),
    );
  }

  Widget _buildLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLegendItem(Colors.green[400]!, 'Completed'),
        const SizedBox(width: 20),
        _buildLegendItem(Colors.blue[400]!, 'In Progress'),
      ],
    );
  }

  Widget _buildLegendItem(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(fontWeight: FontWeight.w500)),
      ],
    );
  }
}
