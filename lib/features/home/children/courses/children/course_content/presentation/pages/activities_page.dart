import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../widgets/ai_reading_tile.dart';
import '../widgets/bottom_sheet_create_content.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({super.key});

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  RefreshController refreshControllerT = RefreshController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getAllCourses();
    });
  }

  void _getAllCourses() {

  }

  @override
  void dispose() {
    refreshControllerT.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: SmartRefresher(
          header: WaterDropHeader(
            complete: Icon(Icons.check, color: Colors.blue[400]),
            waterDropColor: Colors.blue[400]!,
          ),
          controller: refreshControllerT,
          enablePullDown: true,
          onRefresh:
              () {},
          child:
          false
              ? _buildDefaoultPage()
              : ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10),
            itemCount: 10,
            itemBuilder:
                (context, index) => GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/AI_activity');
              },
              child: AIReadingTile(
                imageUrl:
                "https://firebasestorage.googleapis.com/v0/b/graduation-project-e4ecf.firebasestorage.app/o/admin_src%2Fimg%2Freading_1.jpg?alt=media&token=7d3f606b-2cbe-4bda-86ec-ca78f9c2b2a3",
                title: "Actividad de lectura",
              ),
            ),
          ),
          // : ListView.builder(
          //   itemCount: courseContentVM.activities.length,
          //   itemBuilder:
          //       (context, index) => ListTile(
          //         leading: CircleAvatar(
          //           backgroundColor: Colors.blueAccent,
          //           child: Icon(Icons.notes_outlined),
          //         ),
          //         title: Text(
          //           courseContentVM.activities[index].title,
          //           style: TextStyle(fontWeight: FontWeight.bold),
          //         ),
          //         subtitle: Text(
          //           "Publicado el: ${courseContentVM.activities[index].updatedAt.day} de ${DateTimeUtils.convertIntToMonth(courseContentVM.activities[index].updatedAt.month)} ",
          //         ),
          //         trailing: IconButton(
          //           onPressed: () {},
          //           icon: Icon(Icons.more_vert_outlined),
          //         ),
          //       ),
          // ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottomSheetCreateResource(context);
        },
        child: const Icon(Icons.add, color: Colors.blue),
      ),
    );
  }

  Column _buildDefaoultPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //
        //Image
        SizedBox(
          height: 300,
          child: Image.asset("assets/img/background_course_content_1.png"),
        ),
        Text("Aquí puedes asignar los trabajo", style: TextStyle(fontSize: 20)),
        Text(
          "Puedes agregar tareas y trabajos",
          style: TextStyle(fontSize: 15),
        ),
      ],
    );
  }
}
