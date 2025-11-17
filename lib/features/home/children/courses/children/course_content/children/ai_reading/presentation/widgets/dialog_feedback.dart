import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/domain/entities/feedback_entity.dart';
import 'package:flutter/material.dart';

class FeedbackDialog extends StatelessWidget {
  final FeedbackEntity result;

  const FeedbackDialog({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Resultados de tu paráfrasis",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              _buildScoreRow("Similitud", result.similarityScore),
              const SizedBox(height: 10),
              _buildScoreRow("Fluidez", result.fluencyScore),
              const SizedBox(height: 10),
              _buildScoreRow("Originalidad", result.originalityScore),
              const SizedBox(height: 20),

              const Text(
                "Retroalimentación",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(result.feedback, style: const TextStyle(height: 1.5)),

              const SizedBox(height: 25),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cerrar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScoreRow(String label, int value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
            Text(
              "$value%",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 4),
        LinearProgressIndicator(
          value: value / 100,
          minHeight: 8,
          borderRadius: BorderRadius.circular(8),
          backgroundColor: Colors.grey.shade300,
          color: _getScoreColor(value),
        ),
      ],
    );
  }

  Color _getScoreColor(int score) {
    if (score >= 90) return Colors.green;
    if (score >= 70) return Colors.orange;
    return Colors.red;
  }
}

void showFeedbackDialog(BuildContext context, FeedbackEntity feedback) {
  showDialog(
    context: context,
    builder: (_) => FeedbackDialog(result: feedback),
  );
}
