import 'package:client_app/core/routing/route_names.dart';
import 'package:client_app/features/home/children/course_content/presentation/pages/person_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../shared/widgets/appbar_bottom_line.dart';
import 'activities_page.dart';

class PagesContainer extends StatefulWidget {
  const PagesContainer({super.key});

  @override
  State<PagesContainer> createState() => _PagesContainerState();
}

class _PagesContainerState extends State<PagesContainer> {
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarContainer(
        context,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () => context.go(RouteNames.home),
            icon: Icon(Icons.arrow_back),
          ),
          actions: [
            IconButton(
              onPressed: () {
                context.push(RouteNames.courseSettings);
              },
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                IndexedStack(
                  index: _currentIndex,
                  children: [
                    //NewsPage(),
                    ActivitiesPage(),
                    PersonPage(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
         if(mounted){
           setState(() {
             _currentIndex = value;
           });
         }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.book_online),
            label: 'Actividades',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Estudiantes',
          ),
        ],
      ),
    );
  }
}
