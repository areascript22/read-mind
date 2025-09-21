import 'package:client_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:client_app/core/common/utils/toast_util.dart';
import 'package:client_app/features/home/children/courses/presentation/bloc/courses_bloc/courses_bloc.dart';
import 'package:client_app/shared/widgets/loader_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/common/widget/custom_button.dart';
import '../widgets/textfield_code_course.dart';

class EnrollCourse extends StatefulWidget {
  const EnrollCourse({super.key});

  @override
  State<EnrollCourse> createState() => _EnrollCourseState();
}

class _EnrollCourseState extends State<EnrollCourse> {
  final codeTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close),
        ),
        title: const Text("Unete a un curso"),
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Profile
            const Text(
              "Accederas como",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildUserBanner(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Divider(),
            ),
            //Code message
            const Text(
              "Pídele al propietario del curso el código del curso, y luego, ingrésalo aquí.",
            ),
            //TextField
            const SizedBox(height: 20),
            TextFieldCodeCourse(
              label: "Código del curso",
              textEditingController: codeTextController,
            ),
            const SizedBox(height: 15),
            BlocConsumer<CoursesBloc, CoursesState>(
              builder: (context, state) {
                final isLoading =
                    state is CourseLoading &&
                    state.courseAction == CourseAction.enroll;
                return CustomButton(
                  onTap:
                      isLoading
                          ? () {}
                          : () {
                            if (codeTextController.text.trim().isEmpty) {
                              ToastMessageUtil.showToast(
                                "Ingresa el código de invitación",
                                context,
                              );
                              return;
                            }
                            context.read<CoursesBloc>().add(
                              CoursesEnrollEvent(
                                inviteCode: codeTextController.text.trim(),
                              ),
                            );
                          },
                  child: isLoading ? LoaderIndicator() : Text("Unirse"),
                );
              },
              listener: (context, state) {
                if (state is CourseFailure &&
                    state.courseAction == CourseAction.enroll) {
                  ToastMessageUtil.showToast(state.message, context);
                }

                if (state is CourseEnrolledState) {
                  ToastMessageUtil.showToast(state.message, context);
                  context.read<CoursesBloc>().add(CoursesGetAllEnrolledEvent());
                  Navigator.pop(context);
                }
              },
            ),
            _buildIndicationsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildUserBanner() {
    return BlocConsumer<AppUserCubit, AppUserState>(
      builder: (context, state) {
        if (state is AppUserLoggedIn) {
          final user = state.userEntity;
          return Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(user.name.substring(0, 2)),
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(user.email),
                ],
              ),
            ],
          );
        }
        return SizedBox.shrink();
      },
      listener: (context, state) {},
    );
  }

  Widget _buildIndicationsSection() {
    return Column(
      children: [
        const SizedBox(height: 10),
        Divider(),
        const Text(
          "Indicaciónes para acceder con un código de la clase",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),

        const Padding(
          padding: EdgeInsets.only(left: 20, top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("• Usa una cuenta autorizada"),
              SizedBox(height: 6),
              Text(
                "• Usa un código de la clase que tenga entre 6 y 8 letras o números, sin espacios ni símbolos",
              ),
            ],
          ),
        ),

        //Help messages
        const SizedBox(height: 20),
        RichText(
          text: TextSpan(
            style: const TextStyle(color: Colors.black),
            children: [
              const TextSpan(
                text:
                    "Si tienes problemas para unirte a la clase, revisa la ayuda ",
              ),
              TextSpan(
                text: "Centro de ayuda",
                style: const TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
