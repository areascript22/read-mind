import 'package:client_app/core/common/utils/date_util.dart';
import 'package:client_app/core/common/utils/toast_util.dart';
import 'package:client_app/features/home/children/courses/children/course_content/presentation/bloc/activity_progress/activity_progress_bloc.dart';
import 'package:client_app/init_dependencies.dart';
import 'package:client_app/shared/widgets/loader_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../core/routing/route_names.dart';
import '../../data/models/activity_model/activity_model.dart';

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
      ) {
        return _buildAIReadingTile(
          context,
          id: id,
          title: title,
          description: description,
          dueDate: dueDate,
          content: content,
          length: length,
          complexity: complexity,
          style: style,
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
      ),
    );
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

// Widget interno que contiene la lógica del BlocConsumer
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
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ActivityProgressBloc>().add(
          CreateInitialProgressEvent(activityId: activityId),
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
              // BlocConsumer específico para este tile
              BlocConsumer<ActivityProgressBloc, ActivityProgressState>(
                builder: (context, state) {
                  // Solo este tile mostrará el loader cuando esté en loading
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
                    print("sadfasdfssdfasdf");
                    // Navegar a la actividad cuando se crea el progreso
                    context.push(RouteNames.activityAIReading, extra: activity);
                  }
                },
              ),

              // Contenido principal del tile
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
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),

              // Description
              Text(
                description,
                style: TextStyle(color: Colors.grey[700], fontSize: 14),
              ),
              const SizedBox(height: 10),

              // Metadata Chips
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

              // Due date
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today,
                    size: 14,
                    color: Colors.redAccent,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "Fecha límite: ${DateUtil.formatDate(dueDate.toString())}",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.redAccent,
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
