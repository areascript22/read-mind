import 'package:client_app/features/home/children/courses/presentation/pages/course_management.dart';
import 'package:flutter/material.dart';





class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int currentIndex = 0;
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;
  final Color selectedColor = Colors.lightBlue;
  final Color unselectedColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      3,
          (index) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 200),
      ),
    );

    _animations =
        _controllers
            .map(
              (controller) => Tween<double>(begin: 1.0, end: 1.3).animate(
            CurvedAnimation(
              parent: controller,
              curve: Curves.easeOut,
              reverseCurve: Curves.easeIn,
            ),
          ),
        )
            .toList();
  }

  void _onTap(int index) {
    setState(() => currentIndex = index);

    // Start animation
    _controllers[index].forward().then((_) {
      _controllers[index].reverse();
    });
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Widget _buildAnimatedIcon(int index, Widget icon) {
    return ScaleTransition(scale: _animations[index], child: icon);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  IndexedStack(
                    index: currentIndex,
                    children: const [
                      CourseManagementPage(),
                      Center(child: Text("Gramática")),
                      Center(child: Text("Premium")),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //elevation: 4,
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        onTap: _onTap,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        //   selectedItemColor: Colors.blue,
        // unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Column(
              children: [
                _buildAnimatedIcon(0, Icon(Icons.house, size: 20)),
                SizedBox(height: 4),
                _buildAnimatedIcon(
                  0,
                  Text(
                    "Home",
                    style: TextStyle(
                      fontSize: 10,
                      color:
                      currentIndex == 0 ? selectedColor : unselectedColor,
                    ),
                  ),
                ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                _buildAnimatedIcon(
                  1,
                  Icon(Icons.baby_changing_station, size: 20),
                ),
                SizedBox(height: 4),
                _buildAnimatedIcon(
                  1,
                  Text(
                    "Gramatica",
                    style: TextStyle(
                      fontSize: 10,
                      color:
                      currentIndex == 1 ? selectedColor : unselectedColor,
                    ),
                  ),
                ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                _buildAnimatedIcon(
                  2,
                  Icon(Icons.add, size: 20),
                ),
                SizedBox(height: 4),
                _buildAnimatedIcon(
                  2,
                  Text(
                    "Home",
                    style: TextStyle(
                      fontSize: 10,
                      color:
                      currentIndex == 2 ? selectedColor : unselectedColor,
                    ),
                  ),
                ),
              ],
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
