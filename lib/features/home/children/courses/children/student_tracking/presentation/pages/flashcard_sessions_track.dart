import 'package:client_app/features/home/children/courses/domain/entities/flash_card_session_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../../../core/common/entities/user_entity.dart';
import '../bloc/progress_bloc/tracking_bloc.dart';

class FlashCardSessionTrack extends StatefulWidget {
  final int flashcardActId;
  final UserEntity userEntity;
  final int courseId;
  const FlashCardSessionTrack({
    super.key,
    required this.flashcardActId,
    required this.userEntity,
    required this.courseId,
  });

  @override
  State<FlashCardSessionTrack> createState() => _FlashCardSessionTrackState();
}

class _FlashCardSessionTrackState extends State<FlashCardSessionTrack> {
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    _fetchFlashCardSessions();
  }

  void _fetchFlashCardSessions() {
    context.read<TrackingBloc>().add(
      FetchAllFlashCardSessions(
        flashcardActId: widget.flashcardActId,
        targetUserId: widget.userEntity.id,
      ),
    );
  }

  void _onRefresh() {
    _fetchFlashCardSessions();
    _refreshController.refreshCompleted();
  }

  LineChartData _buildAverageScoreChart(
    List<FlashCardSessionEntity> flashCardSessions,
  ) {
    final spots =
        flashCardSessions
            .asMap()
            .entries
            .map(
              (entry) => FlSpot(
                entry.key.toDouble() +
                    1, // Eje X: número de intento (1, 2, 3...)
                entry.value.score
                    .toDouble(), // Eje Y: averageScore (ya es double)
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
            interval: 1, // Mostrar cada valor entero
            getTitlesWidget: (value, meta) {
              // Solo mostrar etiquetas para valores enteros que estén en el rango
              if (value == value.toInt() &&
                  value >= 1 &&
                  value <= flashCardSessions.length) {
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
            interval: 20, // Mostrar cada 20 puntos en el eje Y
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
      minX: 0.5, // Empezar un poco antes para mejor visualización
      maxX:
          flashCardSessions.length.toDouble() + 0.5, // Terminar un poco después
      minY: 0,
      maxY: 100,
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          color: Colors.purple,
          barWidth: 4,
          isStrokeCapRound: true,
          dotData: FlDotData(show: true),
          belowBarData: BarAreaData(show: false),
        ),
      ],
      lineTouchData: LineTouchData(
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.purple.withOpacity(0.8),
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
  LineChartData _buildTimeSpentChart(
    List<FlashCardSessionEntity> flashCardSession,
  ) {
    final spots =
        flashCardSession
            .asMap()
            .entries
            .map(
              (entry) => FlSpot(
                entry.key.toDouble() + 1, // Eje X: número de intento
                entry.value.totalTimeSec
                    .toDouble(), // Eje Y: tiempo en segundos
              ),
            )
            .toList();

    // Encontrar el máximo tiempo para establecer el rango del eje Y
    double maxTime = 0;
    if (flashCardSession.isNotEmpty) {
      if (flashCardSession.length > 1) {
        maxTime =
            flashCardSession
                .map((e) => e.totalTimeSec)
                .reduce((a, b) => a > b ? a : b)
                .toDouble();
      } else {
        maxTime = flashCardSession.first.totalTimeSec.toDouble();
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
            interval: 1, // Mostrar cada valor entero
            getTitlesWidget: (value, meta) {
              // Solo mostrar etiquetas para valores enteros que estén en el rango
              if (value == value.toInt() &&
                  value >= 1 &&
                  value <= flashCardSession.length) {
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
            interval: yInterval, // Intervalos dinámicos basados en maxTime
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
      maxX: flashCardSession.length.toDouble() + 0.5,
      minY: 0,
      maxY: maxTime * 1.2,
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          color: Colors.orange,
          barWidth: 4,
          isStrokeCapRound: true,
          dotData: FlDotData(show: true),
          belowBarData: BarAreaData(show: false),
        ),
      ],
      lineTouchData: LineTouchData(
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.orange.withOpacity(0.8),
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black87),
        title: Text(
          'Flash cards attempts',
          style: Theme.of(context).textTheme.titleLarge,
        ),

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            context.read<TrackingBloc>().add(
              LoadTrackingEvent(
                userId: widget.userEntity.id,
                courseId: widget.courseId,
              ),
            );
          },
          icon: Icon(Icons.close),
        ),
      ),
      body: BlocConsumer<TrackingBloc, TrackingState>(
        listener: (context, state) {
          if (state is TrackingError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is TrackingLoading &&
              state.operation == TrackingOperation.flashCardSessionAll) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is TrackingAllFlashCardSessions) {
            final List<FlashCardSessionEntity> mainIdeas = state.flashCards;

            if (mainIdeas.isEmpty) {
              return const Center(child: Text("No flash cards attempts yet."));
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
                              color: Colors.purple[800],
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
                              _buildAverageScoreChart(mainIdeas),
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
                              color: Colors.orange[800],
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
                            child: LineChart(_buildTimeSpentChart(mainIdeas)),
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
      ),
    );
  }
}
