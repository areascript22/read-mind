import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/presentation/widgets/dialog/dialog_delte_activity_reading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../../../core/common/utils/date_util.dart';
import '../../../../../../../../../../core/common/utils/toast_util.dart';
import '../../../../../../../../../../core/routing/route_names.dart';
import '../../../../../../../../../../shared/widgets/loader_indicator.dart';
import '../../../../data/models/activity_model/activity_model.dart';
import '../../../../presentation/bloc/activity_progress/activity_progress_bloc.dart';
import '../../domain/entities/aireading_update_params_entity.dart';

class AIReadingTileContent extends StatelessWidget {
  final int id;
  final int aiReadingId;
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
  final bool hasModifyPermissions;

  const AIReadingTileContent({
    super.key,
    required this.id,
    required this.aiReadingId,
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
    required this.hasModifyPermissions,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ActivityProgressBloc>().add(
          CreateInitialProgressEvent(
            aiReadingId: aiReadingId,
            activityId: activityId,
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 0,
        color: Colors.white,
        surfaceTintColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade200, width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocConsumer<ActivityProgressBloc, ActivityProgressState>(
                  builder: (context, state) {
                    if (state is ProgressLoading &&
                        state.operation == ProgressActOperation.create &&
                        aiReadingId == state.aiReadingId) {
                      return Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            LoaderIndicator(spinnerSize: 15),
                            const SizedBox(width: 8),
                            Text(
                              'Preparando actividad...',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.blue.shade700,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                  listener: (context, state) {
                    if (state is ProgressError &&
                        state.operation == ProgressActOperation.create &&
                        aiReadingId == state.aiReadingId) {
                      ToastMessageUtil.showToast(state.message, context);
                    }

                    if (state is ProgressCreated &&
                        aiReadingId == state.aiReadingId) {
                      context.push(
                        RouteNames.readingActivitiesContainer,
                        extra: activity,
                      );
                    }

                    if (state is ProgressActivityOverdue &&
                        aiReadingId == state.aiReadingId) {
                      ToastMessageUtil.showToast("Actividad vencida", context);
                    }
                  },
                ),

                // Header con título y score
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/images/svg/reading.svg',
                      height: 48,
                      width: 48,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            description,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 13,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    if (totalScore != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: _getScoreColor(totalScore!),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "${totalScore!.toInt()}/100",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    if (hasModifyPermissions)
                      PopupMenuButton<String>(
                        onSelected: (String value) {
                          switch (value) {
                            case 'opcion1':
                              context.push(
                                RouteNames.aiReadingUpdateParams,
                                extra: AiReadingUpdateParamsEntity(
                                  aiReadingEntity:
                                      activity.toAIReadingEntity()!,
                                  activityId: activityId,
                                ),
                              );
                              break;
                            case 'opcion2':
                              showDeleteActivityAlertReading(
                                context: context,
                                activityId: activityId,
                              );
                              break;
                          }
                        },
                        itemBuilder: (BuildContext context) {
                          return [
                            PopupMenuItem<String>(
                              value: 'opcion1',
                              child: Row(
                                children: [
                                  Icon(Icons.edit, color: Colors.blue),
                                  SizedBox(width: 10),
                                  Text('Editar'),
                                ],
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: 'opcion2',
                              child: Row(
                                children: [
                                  Icon(Icons.delete, color: Colors.red),
                                  SizedBox(width: 10),
                                  Text('Eliminar'),
                                ],
                              ),
                            ),
                          ];
                        },
                      ),
                  ],
                ),
                const SizedBox(height: 16),

                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    _buildInfoChip(
                      Icons.schedule,
                      length,
                      Colors.blue.shade600,
                    ),
                    _buildInfoChip(
                      Icons.trending_up,
                      complexity,
                      Colors.orange.shade600,
                    ),
                    _buildInfoChip(
                      Icons.text_fields,
                      style,
                      Colors.purple.shade600,
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: _getDueDateColor(dueDate).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: _getDueDateColor(dueDate).withValues(alpha: 0.3),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 12,
                        color: _getDueDateColor(dueDate),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "Fecha límite: ${DateUtil.formatDateWithTime(dueDate.toString())}",
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: _getDueDateColor(dueDate),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
      return Colors.red.shade600;
    } else if (due.isAtSameMomentAs(today)) {
      return Colors.orange.shade600;
    } else {
      return Colors.green.shade600;
    }
  }

  Color _getScoreColor(double score) {
    if (score >= 80) return Colors.green.shade500;
    if (score >= 60) return Colors.orange.shade500;
    return Colors.red.shade500;
  }

  Widget _buildInfoChip(IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withValues(alpha: 0.2), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
