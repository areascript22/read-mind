
import 'package:client_app/features/home/children/courses/domain/entities/course_entity.dart';
import 'package:flutter/material.dart';

class BottomSheetOptionsCourse extends StatelessWidget {
  final CourseEntity course;
  const BottomSheetOptionsCourse({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/join_course");
              },
              child: Text(
                "Compartir vínculo de invitación",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 35),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/edit_course", arguments: course);
              },
              child: Text(
                "Editar",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 35),
            GestureDetector(
              onTap: () async {

              },
              child: Text(
                "Archivar",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void bottomSheetOptionsCourse(
  BuildContext context,
 CourseEntity course,
) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return BottomSheetOptionsCourse(
        course: course,
      );
    },
  );
}
