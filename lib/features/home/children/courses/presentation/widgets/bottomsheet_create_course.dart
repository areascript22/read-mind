import 'package:flutter/material.dart';

class BottomSheetCreateCourse extends StatelessWidget {
  const BottomSheetCreateCourse({
    super.key,
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
            //Join a course
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/join_course");
              },
              leading: Icon(Icons.join_full_outlined),
              title: Text(
                "Unirse a un curso",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),

            //Create course
            const SizedBox(height: 35),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/create_course");
              },
              leading: Icon(Icons.create_outlined),
              title: Text(
                "Crear un curso",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void bottomSheetCreateCourse(
  BuildContext context,
) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return BottomSheetCreateCourse(
      );
    },
  );
}
