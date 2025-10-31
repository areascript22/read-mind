import 'package:client_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:client_app/core/common/entities/user_entity.dart';
import 'package:client_app/core/common/enums/user_roles.dart';
import 'package:client_app/features/home/children/courses/presentation/pages/course_management.dart';
import 'package:client_app/features/home/children/profile/presentation/pages/user_profile.dart';
import 'package:client_app/features/home/children/users/presentation/pages/user_management.dart';
import 'package:client_app/features/home/children/vocabulary/presentation/pages/vocabulary_page.dart';
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
  late UserEntity? userEntity;
  late List<Widget> pages;
  late List<BottomNavigationBarItem> navItems;

  @override
  void initState() {
    super.initState();
    userEntity = context.read<AppUserCubit>().user;
    _setupPagesAndControllers();
  }

  void _setupPagesAndControllers() {
    final isAdmin = [
      UserRoles.admin.name,
      UserRoles.superUser.name,
    ].contains(userEntity?.role.name ?? '');

    pages = [
      const CourseManagementPage(),
      VocabularyPage(),
      if (isAdmin) const UserManagementPage(),
      BlocConsumer<AppUserCubit, AppUserState>(
        builder: (context, state) {
          if (state is AppUserLoggedIn) {
            return UserProfilePage(user: state.userEntity);
          }
          return const Center(child: Text('User Profile'));
        },
        listener: (context, state) {},
      ),
    ];

    final itemCount = isAdmin ? 4 : 3;

    _controllers = List.generate(
      itemCount,
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

    navItems = [
      _buildNavItem(0, 'assets/images/svg/home.svg', 'Inicio'),
      _buildNavItem(1, 'assets/images/svg/vocabulary.svg', 'Vocabulario'),
      if (isAdmin) _buildNavItem(2, 'assets/images/svg/admin.svg', 'Admin'),
      _buildNavItem(isAdmin ? 3 : 2, 'assets/images/svg/user.svg', 'Perfil'),
    ];
  }

  void _onTap(int index) {
    setState(() => currentIndex = index);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: IndexedStack(index: currentIndex, children: pages)),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        currentIndex: currentIndex,
        onTap: _onTap,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: selectedColor, // blue
        unselectedItemColor: unselectedColor, // grey
        items: navItems,
      ),
    );
  }

  Widget _buildAnimatedIcon(int index, Widget icon) {
    return ScaleTransition(scale: _animations[index], child: icon);
  }

  BottomNavigationBarItem _buildNavItem(int index, String asset, String label) {
    return BottomNavigationBarItem(
      icon: _buildAnimatedIcon(
        index,
        SvgPicture.asset(asset, height: 25, width: 25),
      ),
      label: label, // Let BottomNavigationBar handle the text
    );
  }
}
