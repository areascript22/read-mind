import 'package:client_app/core/common/utils/date_util.dart';
import 'package:flutter/material.dart';

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
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: ListTile(
        leading: const Icon(
          Icons.menu_book,
          color: Colors.blueAccent,
          size: 32,
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(description, style: TextStyle(color: Colors.grey[700])),
            const SizedBox(height: 6),
            Text(
              "Fecha límite: ${DateUtil.formatDate(dueDate.toString())}",
              style: const TextStyle(fontSize: 12, color: Colors.redAccent),
            ),
          ],
        ),
      ),
    );
  }
}
