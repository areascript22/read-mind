import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../domain/entities/summary_attempt_entity.dart';

class SummaryAttemptTileTracking extends StatelessWidget {
  final SummaryAttemptEntity attempt;

  const SummaryAttemptTileTracking({super.key, required this.attempt});

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
                          Icons.fact_check,
                          Colors.blue,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Flexible(
                        child: _buildScoreBadge(
                          'Coverage',
                          attempt.coverageScore,
                          Icons.align_horizontal_center,
                          Colors.green,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Flexible(
                        child: _buildScoreBadge(
                          'Clarity',
                          attempt.clarityScore,
                          Icons.visibility,
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

            // Score visualization with radial progress
            _buildScoreVisualization(attempt),

            const SizedBox(height: 16),

            // Overall performance score
            _buildOverallPerformance(attempt),

            const SizedBox(height: 16),

            // Feedback section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.summarize, size: 16, color: Colors.teal[700]),
                    const SizedBox(width: 6),
                    Text(
                      'Summary Feedback',
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
                    color: Colors.teal[50],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.teal[100]!),
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

  Widget _buildScoreVisualization(SummaryAttemptEntity attempt) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Summary Quality Metrics',
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(height: 12),
        LayoutBuilder(
          builder: (context, constraints) {
            return _buildDetailedScoreVisualization(attempt);
          },
        ),
      ],
    );
  }

  Widget _buildDetailedScoreVisualization(SummaryAttemptEntity attempt) {
    return Row(
      children: [
        // Radial progress for overall score
        _buildRadialProgress(attempt),
        const SizedBox(width: 16),
        // Score bars
        Expanded(
          child: Column(
            children: [
              _buildMetricBar(
                'Accuracy',
                attempt.accuracyScore,
                Icons.fact_check,
                Colors.blue,
                'Factual correctness',
              ),
              const SizedBox(height: 8),
              _buildMetricBar(
                'Coverage',
                attempt.coverageScore,
                Icons.align_horizontal_center,
                Colors.green,
                'Content completeness',
              ),
              const SizedBox(height: 8),
              _buildMetricBar(
                'Clarity',
                attempt.clarityScore,
                Icons.visibility,
                Colors.purple,
                'Readability & structure',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRadialProgress(SummaryAttemptEntity attempt) {
    final averageScore =
        (attempt.accuracyScore + attempt.coverageScore + attempt.clarityScore) /
        3;

    return Container(
      width: 80,
      height: 80,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background circle
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey[300]!, width: 2),
            ),
          ),
          // Progress circle
          SizedBox(
            width: 64,
            height: 64,
            child: CircularProgressIndicator(
              value: averageScore / 100,
              strokeWidth: 4,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(
                _getOverallScoreColor(averageScore),
              ),
            ),
          ),
          // Score text
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${averageScore.toStringAsFixed(0)}%',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: _getOverallScoreColor(averageScore),
                ),
              ),
              Text(
                'Overall',
                style: GoogleFonts.poppins(
                  fontSize: 8,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricBar(
    String label,
    double score,
    IconData icon,
    Color color,
    String description,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 14, color: color),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                ),
              ),
            ),
            Text(
              '${score.toStringAsFixed(0)}%',
              style: GoogleFonts.poppins(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Container(
          height: 6,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(3),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: score,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [color, color.withValues(alpha: 0.7)],
                ),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          description,
          style: GoogleFonts.poppins(fontSize: 9, color: Colors.grey[500]),
        ),
      ],
    );
  }

  Widget _buildOverallPerformance(SummaryAttemptEntity attempt) {
    final averageScore =
        (attempt.accuracyScore + attempt.coverageScore + attempt.clarityScore) /
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
          // Performance icon
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: performanceLevel.color.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              performanceLevel.icon,
              size: 18,
              color: performanceLevel.color,
            ),
          ),
          const SizedBox(width: 10),

          // Performance text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  performanceLevel.title,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
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
        title: 'Excellent Summary',
        description: 'Comprehensive and well-structured',
        color: Colors.green,
        icon: Icons.emoji_events,
      );
    } else if (averageScore >= 70) {
      return PerformanceLevel(
        title: 'Good Summary',
        description: 'Covers main points clearly',
        color: Colors.blue,
        icon: Icons.thumb_up,
      );
    } else if (averageScore >= 60) {
      return PerformanceLevel(
        title: 'Needs Improvement',
        description: 'Some key aspects missing',
        color: Colors.orange,
        icon: Icons.build,
      );
    } else {
      return PerformanceLevel(
        title: 'Needs Revision',
        description: 'Review content understanding',
        color: Colors.red,
        icon: Icons.lightbulb_outline,
      );
    }
  }

  Color _getOverallScoreColor(double score) {
    if (score >= 80) return Colors.green;
    if (score >= 60) return Colors.orange;
    return Colors.red;
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
