import 'package:client_app/core/common/entities/user_entity.dart';
import 'package:client_app/features/home/children/courses/children/student_tracking/presentation/bloc/progress_bloc/tracking_bloc.dart';
import 'package:client_app/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../domian/entity/progress_entity.dart';
import '../pages/activity_attempt.dart';

class ActivityTrackingTile extends StatelessWidget {
  final ProgressEntity activity;
  final UserEntity userEntity;

  const ActivityTrackingTile({
    super.key,
    required this.activity,
    required this.userEntity,
  });

  @override
  Widget build(BuildContext context) {
    final completed = activity.completed;
    final score = activity.totalScore;
    final dueDate = DateTime.tryParse(activity.dueDate);
    final now = DateTime.now();
    final isOverdue = dueDate != null && now.isAfter(dueDate) && !completed;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => BlocProvider.value(
                  value: serviceLocator<TrackingBloc>(),
                  child: ActivityAttemptsPage(
                    aiReadingId: activity.aiReadingId,
                    userEntity: userEntity,
                  ),
                ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            if (activity.subactivitiesCompletionRate > 0)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: activity.subactivitiesCompletionRate / 100,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: _getProgressGradient(completed, score),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header with course name and status
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          activity.courseName,
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue[700],
                          ),
                        ),
                      ),
                      _buildStatusBadge(completed, score, isOverdue),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Text(
                    activity.title,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  if (activity.description != null &&
                      activity.description!.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      activity.description!,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],

                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSubactivitiesProgress(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          if (dueDate != null)
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  size: 12,
                                  color:
                                      isOverdue ? Colors.red : Colors.grey[600],
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  _formatDueDate(dueDate),
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        isOverdue
                                            ? Colors.red
                                            : Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          if (activity.hasScoring && completed)
                            Text(
                              '$score%',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: _getScoreColor(score),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBadge(bool completed, int score, bool isOverdue) {
    if (isOverdue) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.red[50],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.warning_amber, size: 12, color: Colors.red[700]),
            const SizedBox(width: 4),
            Text(
              'Overdue',
              style: GoogleFonts.poppins(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Colors.red[700],
              ),
            ),
          ],
        ),
      );
    }

    if (completed) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.green[50],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_circle, size: 12, color: Colors.green[700]),
            const SizedBox(width: 4),
            Text(
              'Completed',
              style: GoogleFonts.poppins(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Colors.green[700],
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.orange[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.access_time, size: 12, color: Colors.orange[700]),
          const SizedBox(width: 4),
          Text(
            'In Progress',
            style: GoogleFonts.poppins(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: Colors.orange[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubactivitiesProgress() {
    final subactivities = activity.subactivitiesCompleted;
    final icons = [
      _SubactivityIcon(
        completed: subactivities.reading,
        icon: Icons.menu_book,
        label: 'Reading',
      ),
      _SubactivityIcon(
        completed: subactivities.paraphrase,
        icon: Icons.format_quote,
        label: 'Paraphrase',
      ),
      _SubactivityIcon(
        completed: subactivities.mainIdea,
        icon: Icons.lightbulb,
        label: 'Main Idea',
      ),
      _SubactivityIcon(
        completed: subactivities.summary,
        icon: Icons.summarize,
        label: 'Summary',
      ),
    ];

    return Row(
      children:
          icons.map((icon) {
            return Container(
              margin: const EdgeInsets.only(right: 8),
              child: Tooltip(
                message: icon.label,
                child: Icon(
                  icon.icon,
                  size: 16,
                  color: icon.completed ? Colors.green : Colors.grey[300],
                ),
              ),
            );
          }).toList(),
    );
  }

  LinearGradient _getProgressGradient(bool completed, int score) {
    if (!completed) {
      return LinearGradient(colors: [Colors.orange[400]!, Colors.orange[600]!]);
    }

    if (score >= 80) {
      return LinearGradient(colors: [Colors.green[400]!, Colors.green[600]!]);
    } else if (score >= 60) {
      return LinearGradient(colors: [Colors.orange[400]!, Colors.orange[600]!]);
    } else {
      return LinearGradient(colors: [Colors.red[400]!, Colors.red[600]!]);
    }
  }

  Color _getScoreColor(int score) {
    if (score >= 80) return Colors.green;
    if (score >= 60) return Colors.orange;
    return Colors.red;
  }

  String _formatDueDate(DateTime dueDate) {
    final now = DateTime.now();
    final difference = dueDate.difference(now);

    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Tomorrow';
    } else if (difference.inDays > 0 && difference.inDays <= 7) {
      return 'In ${difference.inDays} days';
    } else if (difference.inDays < 0) {
      return '${difference.inDays.abs()} days ago';
    } else {
      return '${dueDate.day}/${dueDate.month}/${dueDate.year}';
    }
  }
}

class _SubactivityIcon {
  final bool completed;
  final IconData icon;
  final String label;

  _SubactivityIcon({
    required this.completed,
    required this.icon,
    required this.label,
  });
}
