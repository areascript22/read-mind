import 'package:client_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:client_app/core/common/enums/user_roles.dart';
import 'package:client_app/features/home/children/courses/presentation/bloc/courses_bloc/courses_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/enums/course_option.dart';
import '../bloc/course_option_cubit/course_option_cubit.dart';

class RolCourseOptions extends StatelessWidget {
  const RolCourseOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildOptions();
  }

  BlocBuilder<AppUserCubit, AppUserState> _buildOptions() {
    return BlocBuilder<AppUserCubit, AppUserState>(
      builder: (context, state) {
        if (state is AppUserLoggedIn) {
          final userRole = context.read<AppUserCubit>().user?.role;
          final hasPermissions = [
            UserRoles.professor.name,
            UserRoles.admin.name,
            UserRoles.superUser.name,
          ].contains(userRole?.name ?? 'N/A');
          if (!hasPermissions) return SizedBox.shrink();

          return BlocBuilder<CourseOptionCubit, CourseOptions>(
            builder: (context, selectedOption) {
              final options = CourseOptions.values;

              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    options.map((option) {
                      final isSelected = option == selectedOption;

                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ChoiceChip(
                          label: Text(option.label),
                          selected: isSelected,
                          selectedColor: Colors.grey.shade300,
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          labelStyle: TextStyle(
                            color: isSelected ? Colors.black : Colors.grey,
                            fontWeight:
                                isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                          ),
                          onSelected: (_) {
                            context.read<CourseOptionCubit>().selectOption(
                              option,
                            );

                            if (option == CourseOptions.yourCourses) {
                              context.read<CoursesBloc>().add(
                                CoursesGetAllEnrolledEvent(),
                              );
                            } else {
                              context.read<CoursesBloc>().add(
                                CoursesGetAllEvent(),
                              );
                            }
                          },
                        ),
                      );
                    }).toList(),
              );
            },
          );
        }

        return SizedBox.shrink();
      },
    );
  }
}
