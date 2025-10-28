import 'package:client_app/core/common/utils/date_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/models/activity_model/activity_model.dart';

class ActivityTile extends StatelessWidget {
  final ActivityModel activity;

  const ActivityTile({Key? key, required this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return activity.when(
      aIReading: (
        id,
        title,
        description,
        dueDate,
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
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Row with Icon
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
                  style: const TextStyle(fontSize: 12, color: Colors.redAccent),
                ),
              ],
            ),
          ],
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
