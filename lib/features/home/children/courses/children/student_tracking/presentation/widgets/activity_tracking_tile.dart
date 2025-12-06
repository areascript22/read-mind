import 'package:client_app/core/common/entities/user_entity.dart';
import 'package:client_app/features/home/children/courses/children/student_tracking/data/model/progress/progress_model.dart';
import 'package:client_app/features/home/children/courses/children/student_tracking/presentation/bloc/progress_bloc/tracking_bloc.dart';
import 'package:client_app/features/home/children/courses/children/student_tracking/presentation/pages/flashcard_sessions_track.dart';
import 'package:client_app/features/home/children/courses/domain/entities/course_entity.dart';
import 'package:client_app/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pages/activity_attempt.dart';

class ActivityTrackingTile extends StatelessWidget {
  final ProgressModel activity;
  final UserEntity userEntity;
  final CourseEntity courseEntity;

  const ActivityTrackingTile({
    super.key,
    required this.activity,
    required this.userEntity,
    required this.courseEntity,
  });

  @override
  Widget build(BuildContext context) {
    return activity.map(
      aiReadingProgress: (aiReading) => _buildAiReadingTile(context, aiReading),
      flashCardProgress: (flashCard) => _buildFlashCardTile(context, flashCard),
    );
  }

  // Tile para AI Reading Progress
  Widget _buildAiReadingTile(BuildContext context, AiReadingProgress reading) {
    final completed = reading.completed;
    final score = reading.totalScore;
    final dueDate = DateTime.tryParse(reading.dueDate);
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
                    aiReadingId: reading.aiReadingId,
                    userEntity: userEntity,
                    courseId: courseEntity.id,
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
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Ribbon para tipo de actividad
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.menu_book, size: 12, color: Colors.blue[800]),
                    const SizedBox(width: 4),
                    Text(
                      'Reading Activity',
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue[800],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24), // Espacio para el ribbon
                  // Header con título y estado
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              reading.title,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey[900],
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            if (reading.description != null &&
                                reading.description!.isNotEmpty) ...[
                              const SizedBox(height: 4),
                              Text(
                                reading.description!,
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                    ],
                  ),

                  const SizedBox(height: 16),

                  const SizedBox(height: 16),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Subactivities',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildSubActivitiesProgress(
                        reading.subactivitiesCompleted,
                        reading.subactivitiesCompletionRate,
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Footer con fecha y puntaje
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (dueDate != null)
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today,
                              size: 12,
                              color: isOverdue ? Colors.red : Colors.grey[600],
                            ),
                            const SizedBox(width: 4),
                            Text(
                              _formatDueDate(dueDate, isOverdue),
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color:
                                    isOverdue ? Colors.red : Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      Text(
                        'Score: $score${reading.maxScore != null ? '/${reading.maxScore}' : ''}',
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFlashCardTile(
    BuildContext context,
    FlashCardProgress flashCard,
  ) {
    final completed = false;
    final score = flashCard.totalScore;
    final dueDate = DateTime.tryParse(flashCard.dueDate);
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
                  child: FlashCardSessionTrack(
                    flashcardActId: flashCard.flashCardActivityId,
                    userEntity: userEntity,
                    courseId: courseEntity.id,
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
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.purple[100],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.flash_on, size: 12, color: Colors.purple[800]),
                    const SizedBox(width: 4),
                    Text(
                      'Flash Cards',
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.purple[800],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              flashCard.title,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey[900],
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            if (flashCard.description != null &&
                                flashCard.description!.isNotEmpty) ...[
                              const SizedBox(height: 4),
                              Text(
                                flashCard.description!,
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                    ],
                  ),

                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[200]!),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildFlashCardInfo(
                              icon: Icons.format_list_numbered,
                              label: 'Cards',
                              value: flashCard.maxCards.toString(),
                            ),
                            _buildFlashCardInfo(
                              icon: Icons.shuffle,
                              label: 'Order',
                              value: flashCard.cardOrder,
                            ),
                            _buildFlashCardInfo(
                              icon: Icons.percent,
                              label: 'Progress',
                              value: '${100}%',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Performance',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(height: 8),
                      // _buildFlashCardStats(flashCard.stats),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (dueDate != null)
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today,
                              size: 12,
                              color: isOverdue ? Colors.red : Colors.grey[600],
                            ),
                            const SizedBox(width: 4),
                            Text(
                              _formatDueDate(dueDate, isOverdue),
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color:
                                    isOverdue ? Colors.red : Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Best score: $score${flashCard.maxScore != null ? '/${flashCard.maxScore}' : ''}',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: _getScoreColor(score),
                            ),
                          ),
                          Text(
                            'Started: ${_formatDateTime(flashCard.createdAt)}',
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              color: Colors.grey[500],
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

  Widget _buildSubActivitiesProgress(
    SubactivitiesCompletedModel subactivities,
    int completionRate,
  ) {
    final items = [
      _SubactivityItem(
        completed: subactivities.reading,
        icon: Icons.menu_book,
        label: 'Reading',
      ),
      _SubactivityItem(
        completed: subactivities.paraphrase,
        icon: Icons.format_quote,
        label: 'Paraphrase',
      ),
      _SubactivityItem(
        completed: subactivities.mainIdea,
        icon: Icons.lightbulb,
        label: 'Main Idea',
      ),
      _SubactivityItem(
        completed: subactivities.summary,
        icon: Icons.summarize,
        label: 'Summary',
      ),
    ];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:
              items.map((item) {
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color:
                            item.completed ? Colors.green[50] : Colors.grey[50],
                        shape: BoxShape.circle,
                        border: Border.all(
                          color:
                              item.completed
                                  ? Colors.green[300]!
                                  : Colors.grey[300]!,
                        ),
                      ),
                      child: Icon(
                        item.icon,
                        size: 16,
                        color:
                            item.completed
                                ? Colors.green[700]
                                : Colors.grey[400],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.label,
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                );
              }).toList(),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: LinearProgressIndicator(
                value: completionRate / 100,
                minHeight: 4,
                borderRadius: BorderRadius.circular(2),
                valueColor: AlwaysStoppedAnimation<Color>(
                  completionRate == 100 ? Colors.green : Colors.blue,
                ),
                backgroundColor: Colors.grey[200],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '$completionRate%',
              style: GoogleFonts.poppins(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFlashCardInfo({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 12, color: Colors.purple[600]),
            const SizedBox(width: 4),
            Text(
              label,
              style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey[600]),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
      ],
    );
  }

  Widget _buildFlashCardStats(StatsModel stats) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem(
            label: 'Attempts',
            value: stats.totalAttempts.toString(),
            color: Colors.blue,
          ),
          _buildStatItem(
            label: 'Correct',
            value: '${stats.correctAnswers}',
            color: Colors.green,
          ),
          _buildStatItem(
            label: 'Accuracy',
            value:
                stats.totalAttempts > 0
                    ? '${((stats.correctAnswers / stats.totalAttempts) * 100).toStringAsFixed(0)}%'
                    : '0%',
            color: Colors.purple,
          ),
          _buildStatItem(
            label: 'Avg Time',
            value: '${stats.avgTimePerCard}s',
            color: Colors.orange,
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem({
    required String label,
    required String value,
    required Color color,
  }) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey[600]),
        ),
      ],
    );
  }

  Color _getScoreColor(int score) {
    if (score >= 80) return Colors.green;
    if (score >= 60) return Colors.orange;
    return Colors.red;
  }

  String _formatDueDate(DateTime dueDate, bool isOverdue) {
    final now = DateTime.now();
    final difference = dueDate.difference(now);

    if (difference.inDays == 0) {
      return 'Today ${dueDate.hour}:${dueDate.minute.toString().padLeft(2, '0')}';
    } else if (difference.inDays == 1) {
      return 'Tomorrow';
    } else if (difference.inDays == -1) {
      return 'Yesterday';
    } else if (difference.inDays > 0 && difference.inDays <= 7) {
      return 'In ${difference.inDays} days';
    } else if (difference.inDays < 0 && difference.inDays >= -7) {
      return '${difference.inDays.abs()} days ago';
    } else {
      return '${dueDate.day}/${dueDate.month}/${dueDate.year}';
    }
  }

  String _formatDateTime(String dateTime) {
    try {
      final date = DateTime.parse(dateTime);
      return '${date.day}/${date.month}/${date.year}';
    } catch (_) {
      return dateTime;
    }
  }
}

class _SubactivityItem {
  final bool completed;
  final IconData icon;
  final String label;

  _SubactivityItem({
    required this.completed,
    required this.icon,
    required this.label,
  });
}
