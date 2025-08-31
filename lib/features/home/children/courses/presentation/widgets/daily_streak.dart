import 'package:flutter/material.dart';

class DailyStreakWidget extends StatelessWidget {
  final int currentStreak;
  final List<bool>
  attendance; // List of booleans representing attendance (true = present)

  const DailyStreakWidget({
    super.key,
    required this.currentStreak,
    required this.attendance,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Asistencia',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Current Streak: $currentStreak days',
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 16),
          // Week view
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(7, (index) {
              bool attended =
                  index < attendance.length ? attendance[index] : false;
              return _buildDayIndicator(index, attended);
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildDayIndicator(int dayIndex, bool attended) {
    final dayNames = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
    return Column(
      children: [
        Container(
          width: 30,
          height: 30,
          margin: const EdgeInsets.only(bottom: 4),
          decoration: BoxDecoration(
            color: attended ? Colors.green : Colors.grey[200],
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              dayNames[dayIndex],
              style: TextStyle(
                color: attended ? Colors.white : Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Text(
          '${dayIndex + 1}',
          style: TextStyle(
            fontSize: 10,
            color: attended ? Colors.green : Colors.grey,
          ),
        ),
      ],
    );
  }
}
