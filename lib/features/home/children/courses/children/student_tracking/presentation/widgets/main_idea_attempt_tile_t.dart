import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../domain/entities/main_idea_attempt_entity.dart';

class MainIdeaAttemptTileTracking extends StatelessWidget {
  final MainIdeaAttemptEntity attempt;

  const MainIdeaAttemptTileTracking({super.key, required this.attempt});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Row(
                    children: [
                      Flexible(
                        child: _buildScoreBadge(
                          'Accuracy',
                          attempt.accuracyScore,
                          Icons.alarm,
                          Colors.blue,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Flexible(
                        child: _buildScoreBadge(
                          'Clarity',
                          attempt.clarityScore,
                          Icons.visibility,
                          Colors.green,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Flexible(
                        child: _buildScoreBadge(
                          'Conciseness',
                          attempt.concisenessScore,
                          Icons.short_text,
                          Colors.purple,
                        ),
                      ),
                    ],
                  ),
                ),

                // Date
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    _formatDate(attempt.createdAt),
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            _buildScoreGauges(attempt),

            const SizedBox(height: 16),

            _buildOverallPerformance(attempt),

            const SizedBox(height: 16),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.lightbulb_outline,
                      size: 16,
                      color: Colors.amber[700],
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Main Idea Feedback',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.amber[50],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.amber[100]!),
                  ),
                  child: Text(
                    attempt.feedback,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.grey[800],
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreBadge(
    String label,
    double score,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 10, color: color),
          const SizedBox(width: 3),
          Flexible(
            child: Text(
              score.toStringAsFixed(0),
              style: GoogleFonts.poppins(
                fontSize: 9,
                fontWeight: FontWeight.w700,
                color: color,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScoreGauges(MainIdeaAttemptEntity attempt) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Idea Quality Assessment',
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(height: 12),
        LayoutBuilder(
          builder: (context, constraints) {
            return _buildNormalGauges(attempt);
          },
        ),
      ],
    );
  }

  Widget _buildNormalGauges(MainIdeaAttemptEntity attempt) {
    return Row(
      children: [
        Expanded(
          child: _buildGauge(
            'Accuracy',
            attempt.accuracyScore,
            Icons.alarm,
            Colors.blue,
            'Matches text',
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildGauge(
            'Clarity',
            attempt.clarityScore,
            Icons.visibility,
            Colors.green,
            'Clear expression',
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildGauge(
            'Conciseness',
            attempt.concisenessScore,
            Icons.short_text,
            Colors.purple,
            'Succinct presentation',
          ),
        ),
      ],
    );
  }

  Widget _buildGauge(
    String label,
    double score,
    IconData icon,
    Color color,
    String description,
  ) {
    return Container(
      height: 85, // Altura reducida
      padding: const EdgeInsets.all(8), // Padding reducido
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Mejor distribución
        children: [
          Icon(icon, size: 18, color: color), // Icono más pequeño
          Text(
            '${score.toStringAsFixed(0)}%',
            style: GoogleFonts.poppins(
              fontSize: 12, // Texto más pequeño
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
          // Gauge bar
          Container(
            height: 4, // Barra más delgada
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: score,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
          Column(
            children: [
              Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 9, // Texto más pequeño
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                description,
                style: GoogleFonts.poppins(
                  fontSize: 7, // Texto más pequeño
                  color: Colors.grey[500],
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOverallPerformance(MainIdeaAttemptEntity attempt) {
    final averageScore =
        (attempt.accuracyScore +
            attempt.clarityScore +
            attempt.concisenessScore) /
        3;
    final performanceLevel = _getPerformanceLevel(averageScore);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            performanceLevel.color.withValues(alpha: 0.1),
            performanceLevel.color.withValues(alpha: 0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: performanceLevel.color.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: performanceLevel.color.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              performanceLevel.icon,
              size: 18, // Icono más pequeño
              color: performanceLevel.color,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  performanceLevel.title,
                  style: GoogleFonts.poppins(
                    fontSize: 13, // Texto ligeramente más pequeño
                    fontWeight: FontWeight.w700,
                    color: performanceLevel.color,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  performanceLevel.description,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    color: Colors.grey[600],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // Average score
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: performanceLevel.color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              '${averageScore.toStringAsFixed(0)}%',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: performanceLevel.color,
              ),
            ),
          ),
        ],
      ),
    );
  }

  PerformanceLevel _getPerformanceLevel(double averageScore) {
    if (averageScore >= 85) {
      return PerformanceLevel(
        title: 'Excellent Main Idea',
        description: 'Clear, accurate and concise',
        color: Colors.green,
        icon: Icons.emoji_events,
      );
    } else if (averageScore >= 70) {
      return PerformanceLevel(
        title: 'Good Understanding',
        description: 'Mostly accurate with good clarity',
        color: Colors.blue,
        icon: Icons.thumb_up,
      );
    } else if (averageScore >= 60) {
      return PerformanceLevel(
        title: 'Needs Refinement',
        description: 'Some aspects need improvement',
        color: Colors.orange,
        icon: Icons.build,
      );
    } else {
      return PerformanceLevel(
        title: 'Needs Work',
        description: 'Review the main concepts',
        color: Colors.red,
        icon: Icons.lightbulb_outline,
      );
    }
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}

class PerformanceLevel {
  final String title;
  final String description;
  final Color color;
  final IconData icon;

  PerformanceLevel({
    required this.title,
    required this.description,
    required this.color,
    required this.icon,
  });
}
