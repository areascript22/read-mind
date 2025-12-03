import 'package:client_app/features/home/children/courses/children/course_content/children/flash_cards/presentation/cubit/flashcard_bloc/flash_card_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../../../core/common/utils/date_util.dart';
import '../../../../../../../../core/common/utils/toast_util.dart';
import '../../../../../../../../core/routing/route_names.dart';
import '../../../../../../../../init_dependencies.dart';
import '../../../../../../../../shared/widgets/loader_indicator.dart';
import '../../children/flash_cards/presentation/widget/flash_card_tile.dart';
import '../../data/models/activity_model/activity_model.dart';
import '../bloc/activity_progress/activity_progress_bloc.dart';

class ActivityTile extends StatelessWidget {
  final ActivityModel activity;

  const ActivityTile({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return activity.when(
      aIReading: (
        id,
        title,
        description,
        dueDate,
        aiReadingId,
        content,
        length,
        complexity,
        style,
        createdAt,
        updatedAt,
        totalScore,
      ) {
        return _buildAIReadingTile(
          context,
          id: aiReadingId,
          title: title,
          description: description,
          dueDate: dueDate,
          content: content,
          length: length,
          complexity: complexity,
          style: style,
          totalScore: totalScore,
        );
      },

      flashCard: (
        id,
        title,
        description,
        dueDate,
        hasScoring,
        maxScore,
        createdAt,
        updatedAt,
        flashCardActivityId,
        maxCards,
        cardOrder,
        bestScore,
      ) {
        return _buildFlashCardTile(
          context,
          activityId: id,
          flashCardActivityId: flashCardActivityId,
          title: title,
          description: description,
          dueDate: dueDate,
          maxCards: maxCards,
          cardOrder: cardOrder,
          hasScoring: hasScoring,
          bestScore: bestScore,
        );
      },
    );
  }

  Widget _buildAIReadingTile(
    BuildContext context, {
    required int id,
    required String title,
    required String description,
    required DateTime dueDate,
    required String content,
    required String length,
    required String complexity,
    required String style,
    required double? totalScore,
  }) {
    return BlocProvider.value(
      value: serviceLocator<ActivityProgressBloc>(),
      child: _AIReadingTileContent(
        activityId: id,
        title: title,
        description: description,
        dueDate: dueDate,
        content: content,
        length: length,
        complexity: complexity,
        style: style,
        activity: activity,
        totalScore: totalScore,
      ),
    );
  }

  Widget _buildFlashCardTile(
    BuildContext context, {
    required int activityId,
    required int flashCardActivityId,
    required String title,
    required String description,
    required DateTime dueDate,
    required int maxCards,
    required String cardOrder,
    required bool hasScoring,
    required double? bestScore,
  }) {
    return BlocProvider.value(
      value: serviceLocator<FlashCardBloc>(),
      child: FlashCardTileContent(
        activityId: activityId,
        flashCardActivityId: flashCardActivityId,
        title: title,
        description: description,
        dueDate: dueDate,
        maxCards: maxCards,
        cardOrder: cardOrder,
        hasScoring: hasScoring,
        activity: activity,
        bestScore: bestScore,
      ),
    );
  }
}

class _AIReadingTileContent extends StatelessWidget {
  final int activityId;
  final String title;
  final String description;
  final DateTime dueDate;
  final String content;
  final String length;
  final String complexity;
  final String style;
  final ActivityModel activity;
  final double? totalScore;

  const _AIReadingTileContent({
    required this.activityId,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.content,
    required this.length,
    required this.complexity,
    required this.style,
    required this.activity,
    required this.totalScore,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ActivityProgressBloc>().add(
          CreateInitialProgressEvent(aiReadingId: activityId),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocConsumer<ActivityProgressBloc, ActivityProgressState>(
                builder: (context, state) {
                  if (state is ProgressLoading &&
                      state.operation == ProgressActOperation.create &&
                      activityId == state.activityId) {
                    return Row(
                      children: [
                        LoaderIndicator(spinnerSize: 15),
                        const SizedBox(width: 8),
                        Text(
                          'Preparando actividad...',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    );
                  }
                  return const SizedBox.shrink();
                },
                listener: (context, state) {
                  if (state is ProgressError &&
                      state.operation == ProgressActOperation.create &&
                      activityId == state.activityId) {
                    ToastMessageUtil.showToast(state.message, context);
                  }

                  if (state is ProgressCreated &&
                      activityId == state.activityId) {
                    context.push(RouteNames.activityAIReading, extra: activity);
                  }
                },
              ),

              Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/svg/reading.svg',
                    height: 48,
                    width: 48,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (totalScore != null)
                    Text(
                      "Score: $totalScore/100",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 6),

              Text(
                description,
                style: TextStyle(color: Colors.grey[700], fontSize: 14),
              ),
              const SizedBox(height: 10),

              Wrap(
                spacing: 8,
                runSpacing: 6,
                children: [
                  _buildInfoChip(Icons.timer, length, Colors.blueAccent),
                  _buildInfoChip(
                    Icons.bar_chart,
                    complexity,
                    Colors.orangeAccent,
                  ),
                  _buildInfoChip(Icons.style, style, Colors.purpleAccent),
                ],
              ),
              const SizedBox(height: 10),

              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 14,
                    color: _getDueDateColor(
                      dueDate,
                    ), // También puedes hacer este color dinámico
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "Fecha límite: ${DateUtil.formatDate(dueDate.toString())}",
                    style: TextStyle(
                      fontSize: 12,
                      color: _getDueDateColor(dueDate),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getDueDateColor(DateTime dueDate) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final due = DateTime(dueDate.year, dueDate.month, dueDate.day);

    if (due.isBefore(today)) {
      return Colors.red; // Fecha vencida
    } else if (due.isAtSameMomentAs(today)) {
      return Colors.orangeAccent; // Fecha es hoy
    } else {
      return Colors.green; // Fecha futura
    }
  }

  Widget _buildInfoChip(IconData icon, String label, Color color) {
    return Chip(
      avatar: Icon(icon, size: 16, color: Colors.white),
      label: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
      backgroundColor: color,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
    );
  }
}
