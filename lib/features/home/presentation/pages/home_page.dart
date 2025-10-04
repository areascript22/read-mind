import 'package:client_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:client_app/features/home/children/courses/presentation/pages/course_management.dart';
import 'package:client_app/features/home/children/profile/presentation/pages/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                    children: [
                      CourseManagementPage(),
                      Center(child: Text("Gramática")),
                      BlocConsumer<AppUserCubit, AppUserState>(
                        builder: (context, state) {
                          if (state is AppUserLoggedIn) {
                            return UserProfilePage(user: state.userEntity);
                          }
                          return Center(child: Text('User Profile'));
                        },
                        listener: (context, state) {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //elevation: 4,A
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
                _buildAnimatedIcon(
                  0,
                  SvgPicture.asset(
                    'assets/images/svg/home.svg',
                    height: 25,
                    width: 25,
                  ),
                ),
                SizedBox(height: 4),
                _buildAnimatedIcon(
                  0,
                  Text(
                    "Inicio",
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
                  SvgPicture.asset(
                    'assets/images/svg/vocabulary.svg',
                    height: 25,
                    width: 25,
                  ),
                ),
                SizedBox(height: 4),
                _buildAnimatedIcon(
                  1,
                  Text(
                    "Vocabulario",
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
                  SvgPicture.asset(
                    'assets/images/svg/profile.svg',
                    height: 25,
                    width: 25,
                  ),
                ),
                SizedBox(height: 4),
                _buildAnimatedIcon(
                  2,
                  Text(
                    "Perfil",
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
