import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../domain/entities/paraphrase_attempt_entity.dart';

class ParaphraseAttemptTileTracking extends StatelessWidget {
  final ParaphraseAttemptEntity attempt;

  const ParaphraseAttemptTileTracking({super.key, required this.attempt});

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
            // Header with scores and date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Score badges
                Row(
                  children: [
                    _buildScoreBadge(
                      'Similarity',
                      attempt.similarityScore,
                      Icons.compare_arrows,
                      Colors.blue,
                    ),
                    const SizedBox(width: 8),
                    _buildScoreBadge(
                      'Fluency',
                      attempt.fluencyScore,
                      Icons.air,
                      Colors.green,
                    ),
                    const SizedBox(width: 8),
                    _buildScoreBadge(
                      'Originality',
                      attempt.originalityScore,
                      Icons.auto_awesome,
                      Colors.purple,
                    ),
                  ],
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

            // Score visualization
            _buildScoreVisualization(attempt),

            const SizedBox(height: 16),

            // Feedback section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.feedback, size: 16, color: Colors.orange[700]),
                    const SizedBox(width: 6),
                    Text(
                      'Feedback',
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
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey[200]!),
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

            const SizedBox(height: 8),

            // Performance indicator
            _buildPerformanceIndicator(attempt),
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
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(
            score.toStringAsFixed(1),
            style: GoogleFonts.poppins(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScoreVisualization(ParaphraseAttemptEntity attempt) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Performance Score',
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _buildScoreBar(
                'Similarity',
                attempt.similarityScore,
                Colors.blue,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildScoreBar(
                'Fluency',
                attempt.fluencyScore,
                Colors.green,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildScoreBar(
                'Originality',
                attempt.originalityScore,
                Colors.purple,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildScoreBar(String label, double score, Color color) {
    return Column(
      children: [
        Container(
          height: 6,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(3),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: score, // Assuming scores are 0-100
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 9,
            fontWeight: FontWeight.w500,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildPerformanceIndicator(ParaphraseAttemptEntity attempt) {
    final averageScore =
        (attempt.similarityScore +
            attempt.fluencyScore +
            attempt.originalityScore) /
        3;
    String performance;
    Color color;
    IconData icon;

    if (averageScore >= 80) {
      performance = 'Excellent';
      color = Colors.green;
      icon = Icons.emoji_events;
    } else if (averageScore >= 60) {
      performance = 'Good';
      color = Colors.orange;
      icon = Icons.thumb_up;
    } else {
      performance = 'Needs Improvement';
      color = Colors.red;
      icon = Icons.tips_and_updates;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 6),
          Text(
            performance,
            style: GoogleFonts.poppins(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
          const Spacer(),
          Text(
            'Avg: ${averageScore.toStringAsFixed(1)}',
            style: GoogleFonts.poppins(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
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
