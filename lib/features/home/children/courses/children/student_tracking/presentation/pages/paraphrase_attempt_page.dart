import 'package:client_app/core/common/utils/toast_util.dart';
import 'package:client_app/shared/widgets/loader_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../../../../../../core/common/entities/user_entity.dart';
import '../../../../domain/entities/paraphrase_attempt_entity.dart';
import '../bloc/progress_bloc/tracking_bloc.dart';

class ParaphraseAttemptsPage extends StatefulWidget {
  final int aiReadingId;
  final UserEntity userEntity;
  const ParaphraseAttemptsPage({
    super.key,
    required this.aiReadingId,
    required this.userEntity,
  });

  @override
  State<ParaphraseAttemptsPage> createState() => _ParaphraseAttemptsPageState();
}

class _ParaphraseAttemptsPageState extends State<ParaphraseAttemptsPage> {
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    _fetchParaphrases();
  }

  void _fetchParaphrases() {
    context.read<TrackingBloc>().add(
      FetchAllParaphrasesAttempts(
        aiReadingId: widget.aiReadingId,
        targetUserId: widget.userEntity.id,
      ),
    );
  }

  void _onRefresh() {
    _fetchParaphrases();
    _refreshController.refreshCompleted();
  }

  LineChartData _buildAverageScoreChart(
    List<ParaphraseAttemptEntity> attempts,
  ) {
    final spots =
        attempts
            .asMap()
            .entries
            .map(
              (entry) => FlSpot(
                entry.key.toDouble() +
                    1, // Eje X: número de intento (1, 2, 3...)
                entry.value.averageScore.toDouble(), // Eje Y: averageScore
              ),
            )
            .toList();

    return LineChartData(
      gridData: FlGridData(show: true),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: (value, meta) {
              return Text(
                'At ${value.toInt()}',
                style: TextStyle(fontSize: 10),
              );
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            getTitlesWidget: (value, meta) {
              return Text('${value.toInt()}', style: TextStyle(fontSize: 10));
            },
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d), width: 1),
      ),
      minX: 1,
      maxX: attempts.length.toDouble(),
      minY: 0,
      maxY: 100,
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          color: Colors.blue,
          barWidth: 4,
          isStrokeCapRound: true,
          dotData: FlDotData(show: true),
          belowBarData: BarAreaData(show: false),
        ),
      ],
    );
  }

  // Método para crear datos del gráfico de timeSpentSec
  LineChartData _buildTimeSpentChart(List<ParaphraseAttemptEntity> attempts) {
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
    final maxTime =
        attempts
            .map((e) => e.timeSpentSec)
            .reduce((a, b) => a > b ? a : b)
            .toDouble();

    return LineChartData(
      gridData: FlGridData(show: true),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: (value, meta) {
              return Text(
                'At ${value.toInt()}',
                style: TextStyle(fontSize: 10),
              );
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 50,
            getTitlesWidget: (value, meta) {
              return Text('${value.toInt()}s', style: TextStyle(fontSize: 10));
            },
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d), width: 1),
      ),
      minX: 1,
      maxX: attempts.length.toDouble(),
      minY: 0,
      maxY: maxTime * 1.1, // Añadir 10% de margen
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          color: Colors.green,
          barWidth: 4,
          isStrokeCapRound: true,
          dotData: FlDotData(show: true),
          belowBarData: BarAreaData(show: false),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TrackingBloc, TrackingState>(
      listener: (context, state) {
        if (state is TrackingError) {
          ToastMessageUtil.showToast(state.message, context);
        }
      },
      builder: (context, state) {
        if (state is TrackingLoading &&
            state.operation == TrackingOperation.allParaphrases) {
          return const Center(child: LoaderIndicator());
        }

        if (state is TrackingAllParaphrasesLoaded) {
          final List<ParaphraseAttemptEntity> paraphrases = state.paraphrases;

          if (paraphrases.isEmpty) {
            return const Center(child: Text("No paraphrase attempts yet."));
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
                            color: Colors.blue[800],
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
                          child: LineChart(
                            _buildAverageScoreChart(paraphrases),
                          ),
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
                            color: Colors.green[800],
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
                          child: LineChart(_buildTimeSpentChart(paraphrases)),
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
