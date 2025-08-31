import 'package:client_app/features/home/children/courses/domain/entities/course_entity.dart';
import 'package:flutter/material.dart';

class CourseTile extends StatelessWidget {
  final CourseEntity course;
  final String courseId;
  final String title;
  final int studentCount;
  final String imageAssetPath; // Ej: 'assets/images/background.png'

  const CourseTile({
    super.key,
    required this.courseId,
    required this.title,
    required this.studentCount,
    required this.imageAssetPath,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      child: Container(
        height: 160,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageAssetPath),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withValues(alpha: 0.3),
              BlendMode.darken,
            ),
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Course title
                Text(
                  course.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //Option button
                IconButton(
                  onPressed: () {

                  },
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              course.description,
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
