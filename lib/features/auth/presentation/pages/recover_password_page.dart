import 'package:client_app/core/common/utils/toast_util.dart';
import 'package:client_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:client_app/shared/widgets/loader_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/common/widget/app_version.dart';
import '../../../../core/common/widget/custom_button.dart';
import '../../../../core/routing/route_names.dart';
import '../widgets/Dialogs/dialog_reset_pass_link.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/background1.dart';

class RecoverPasswordPage extends StatefulWidget {
  const RecoverPasswordPage({super.key});

  @override
  State<RecoverPasswordPage> createState() => _RecoverPasswordPageState();
}

class _RecoverPasswordPageState extends State<RecoverPasswordPage> {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: _RecoverClipper(verticalPosition: 100),
              child: Container(
                height: 260,
                color: Colors.green,
                child: const Background1(),
              ),
            ),

            _buildForm(context),
          ],
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(height: 10),

            const Text(
              "Recuperar contraseña",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            // Subtitle
            Text(
              "Ingresa tu correo electrónico y te enviaremos un enlace para recuperar tu contraseña.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[700], fontSize: 15),
            ),

            const SizedBox(height: 25),

            AuthTextField(
              textEditingController: emailController,
              textInputType: TextInputType.emailAddress,
              hintText: "Correo electrónico",
              validator: (value) {
                value = value?.trim();
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese su correo electrónico';
                }
                const pattern =
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                if (!RegExp(pattern).hasMatch(value)) {
                  return 'Correo electrónico inválido';
                }
                return null;
              },
            ),

            const SizedBox(height: 25),

            BlocConsumer<AuthBloc, AuthState>(
              builder: (context, state) {
                bool isLoading = state is AuthLoadingState;

                return CustomButton(
                  onTap:
                      !isLoading
                          ? () {
                            if (formKey.currentState?.validate() ?? false) {
                              context.read<AuthBloc>().add(
                                AuthUserForgotPassword(
                                  email: emailController.text.trim(),
                                ),
                              );
                            }
                          }
                          : () {},
                  child:
                      !isLoading
                          ? const Text("Enviar enlace")
                          : LoaderIndicator(spinnerColor: Colors.blueAccent),
                );
              },
              listener: (context, state) {
                if (state is AuthFailureState) {
                  ToastMessageUtil.showToast(state.message, context);
                }
                if (state is AuthResetPasswordLinkSent) {
                  showResetPasswordLink(context);
                  emailController.clear();
                }
              },
            ),

            const SizedBox(height: 25),

            // Back to Sign In
            TextButton(
              onPressed: () => context.go(RouteNames.signIn),
              child: const Text(
                "Volver a iniciar sesión",
                style: TextStyle(fontSize: 15),
              ),
            ),

            const SizedBox(height: 40),

            const Divider(),
            const AppVersion(),
          ],
        ),
      ),
    );
  }
}

class _RecoverClipper extends CustomClipper<Path> {
  final double verticalPosition;
  final double radius;

  _RecoverClipper({required this.verticalPosition, this.radius = 30});

  @override
  Path getClip(Size size) {
    final path = Path();
    final y = (verticalPosition.clamp(0, 100) / 100) * size.height;

    path.lineTo(0, y);

    // Left curve
    path.quadraticBezierTo(0, y - 20, radius, y - 20);

    final rightStart = Offset(size.width - radius, y - 20);
    path.lineTo(rightStart.dx, rightStart.dy);

    // Right curve
    path.quadraticBezierTo(size.width, y - 20, size.width, y);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant _RecoverClipper oldClipper) {
    return oldClipper.verticalPosition != verticalPosition ||
        oldClipper.radius != radius;
  }
}
