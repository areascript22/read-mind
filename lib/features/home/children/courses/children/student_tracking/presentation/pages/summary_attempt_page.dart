import 'package:client_app/features/home/children/courses/children/student_tracking/presentation/widgets/summary_attempt_tile_t.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../../../core/common/entities/user_entity.dart';
import '../../../../domain/entities/summary_attempt_entity.dart';
import '../bloc/progress_bloc/tracking_bloc.dart';

class SummaryAttemptsPage extends StatefulWidget {
  final int aiReadingId;
  final UserEntity userEntity;
  const SummaryAttemptsPage({
    super.key,
    required this.aiReadingId,
    required this.userEntity,
  });

  @override
  State<SummaryAttemptsPage> createState() => _SummaryAttemptsPageState();
}

class _SummaryAttemptsPageState extends State<SummaryAttemptsPage> {
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    _fetchSummaries();
  }

  void _fetchSummaries() {
    context.read<TrackingBloc>().add(
      FetchAllSummaryAttempts(
        aiReadingId: widget.aiReadingId,
        targetUserId: widget.userEntity.id,
      ),
    );
  }

  void _onRefresh() {
    _fetchSummaries();
    _refreshController.refreshCompleted();
  }

  // Método para crear datos del gráfico de averageScore
  LineChartData _buildAverageScoreChart(List<SummaryAttemptEntity> attempts) {
    final spots =
        attempts
            .asMap()
            .entries
            .map(
              (entry) => FlSpot(
                entry.key.toDouble() +
                    1, // Eje X: número de intento (1, 2, 3...)
                entry.value.averageScore, // Eje Y: averageScore (ya es double)
              ),
            )
            .toList();

    return LineChartData(
      gridData: FlGridData(show: true),
      titlesData: FlTitlesData(
        show: true,
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: (value, meta) {
              if (value == value.toInt() &&
                  value >= 1 &&
                  value <= attempts.length) {
                return Text(
                  'At ${value.toInt()}',
                  style: const TextStyle(fontSize: 10),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            interval: 20,
            getTitlesWidget: (value, meta) {
              return Text(
                '${value.toInt()}',
                style: const TextStyle(fontSize: 10),
              );
            },
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d), width: 1),
      ),
      minX: 0.5,
      maxX: attempts.length.toDouble() + 0.5,
      minY: 0,
      maxY: 100,
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          color: Colors.red, // Color rojo para distinguir de los otros
          barWidth: 4,
          isStrokeCapRound: true,
          dotData: FlDotData(show: true),
          belowBarData: BarAreaData(show: false),
        ),
      ],
      lineTouchData: LineTouchData(
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.red.withOpacity(0.8),
          getTooltipItems: (List<LineBarSpot> touchedSpots) {
            return touchedSpots.map((spot) {
              return LineTooltipItem(
                'At ${spot.x.toInt()}\nPuntuación: ${spot.y.toStringAsFixed(1)}',
                const TextStyle(color: Colors.white),
              );
            }).toList();
          },
        ),
      ),
    );
  }

  // Método para crear datos del gráfico de timeSpentSec
  LineChartData _buildTimeSpentChart(List<SummaryAttemptEntity> attempts) {
    final spots =
        attempts
            .asMap()
            .entries
            .map(
              (entry) => FlSpot(
                entry.key.toDouble() + 1, // Eje X: número de intento
                entry.value.timeSpentSec
                    .toDouble(), // Eje Y: tiempo en segundos
              ),
            )
            .toList();

    // Encontrar el máximo tiempo para establecer el rango del eje Y
    double maxTime = 0;
    if (attempts.isNotEmpty) {
      if (attempts.length > 1) {
        maxTime =
            attempts
                .map((e) => e.timeSpentSec)
                .reduce((a, b) => a > b ? a : b)
                .toDouble();
      } else {
        maxTime = attempts.first.timeSpentSec.toDouble();
      }
    }

    // Si maxTime es 0, establecer un mínimo
    if (maxTime == 0) maxTime = 10;

    // Asegurar que maxY sea al menos 5 para mejor visualización
    if (maxTime < 5) maxTime = 5;

    // Calcular intervalos apropiados para el eje Y
    double yInterval = maxTime / 5;
    if (yInterval < 1) yInterval = 1;
    yInterval = yInterval.ceilToDouble();

    return LineChartData(
      gridData: FlGridData(show: true),
      titlesData: FlTitlesData(
        show: true,
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: (value, meta) {
              if (value == value.toInt() &&
                  value >= 1 &&
                  value <= attempts.length) {
                return Text(
                  'At ${value.toInt()}',
                  style: const TextStyle(fontSize: 10),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 50,
            interval: yInterval,
            getTitlesWidget: (value, meta) {
              return Text(
                '${value.toInt()}s',
                style: const TextStyle(fontSize: 10),
              );
            },
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d), width: 1),
      ),
      minX: 0.5,
      maxX: attempts.length.toDouble() + 0.5,
      minY: 0,
      maxY: maxTime * 1.2,
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          color: Colors.teal, // Color teal para distinguir
          barWidth: 4,
          isStrokeCapRound: true,
          dotData: FlDotData(show: true),
          belowBarData: BarAreaData(show: false),
        ),
      ],
      lineTouchData: LineTouchData(
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.teal.withOpacity(0.8),
          getTooltipItems: (List<LineBarSpot> touchedSpots) {
            return touchedSpots.map((spot) {
              return LineTooltipItem(
                'Intento ${spot.x.toInt()}\nTiempo: ${spot.y.toInt()}s',
                const TextStyle(color: Colors.white),
              );
            }).toList();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TrackingBloc, TrackingState>(
      listener: (context, state) {
        if (state is TrackingError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        if (state is TrackingLoading &&
            state.operation == TrackingOperation.allSummaries) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is TrackingAllSummariesLoaded) {
          final List<SummaryAttemptEntity> summaries = state.summaries;

          if (summaries.isEmpty) {
            return const Center(child: Text("No summary attempts yet."));
          }

          return SmartRefresher(
            controller: _refreshController,
            onRefresh: _onRefresh,
            header: const WaterDropHeader(),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Primer gráfico: Average Score
                  Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Puntuación Promedio por Intento",
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red[800],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Rango: 0-100 puntos",
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 250,
                          child: LineChart(_buildAverageScoreChart(summaries)),
                        ),
                      ],
                    ),
                  ),

                  // Segundo gráfico: Tiempo empleado
                  Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tiempo Empleado por Intento",
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal[800],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Tiempo en segundos",
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 250,
                          child: LineChart(_buildTimeSpentChart(summaries)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return const Center(child: Text("Pull down to refresh."));
      },
    );
  }
}
