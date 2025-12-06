import 'package:client_app/core/common/utils/toast_util.dart';
import 'package:client_app/core/common/widget/app_version.dart';
import 'package:client_app/core/common/widget/custom_button.dart';
import 'package:client_app/core/routing/route_names.dart';
import 'package:client_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../widgets/auth_password_textfield.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/background1.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: TrueInverseRoundedClipper(verticalPosition: 100),
              child: Container(
                color: Colors.green,
                child: SizedBox(height: 300, child: Background1()),
              ),
            ),
            _buildForm(context),
          ],
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 350,
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    //Header
                    Padding(
                      padding: const EdgeInsets.only(top: 0, bottom: 30),
                      child: Row(
                        children: [
                          const Text(
                            "¿Aun no tienes una cuenta? ",
                            style: TextStyle(fontSize: 17),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.go(RouteNames.signUp);
                            },
                            child: const Text(
                              "Crear cuenta",
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.blue,
                                decorationThickness: 0.8,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    AuthTextField(
                      textInputType: TextInputType.emailAddress,
                      textEditingController: emailTextController,
                      hintText: 'Correo electrónico',
                      validator: (value) {
                        FocusScope.of(context).unfocus();
                        value = value?.trim();
                        emailTextController.text =
                            emailTextController.text.trim();
                        if (value == null || value.isEmpty) {
                          return 'Por favor, ingrese su correo electrónico'; // Required validation
                        }
                        const emailPattern =
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                        final emailRegex = RegExp(emailPattern);
                        if (!emailRegex.hasMatch(value)) {
                          return 'Por favor, ingrese un correo electrónico válido';
                        }
                        return null; // Return null if validation passes
                      },
                    ),
                    const SizedBox(height: 15),
                    //password TextField
                    AuthPasswordTextfield(
                      textEditingController: passwordTextController,
                      isObscureText: true,
                      hintText: 'Contraseña',
                      validator: (value) {
                        value = value?.trim();
                        passwordTextController.text =
                            passwordTextController.text.trim();
                        if (value == null || value.isEmpty) {
                          return 'Por favor, ingrese su contraseña'; // Required validation
                        }
                        if (value.length < 8) {
                          return 'La contraseña debe tener al menos 8 caracteres'; // Length validation
                        }
                        return null; // Return null if validation passes
                      },
                    ),

                    const SizedBox(height: 15),
                    _buildForgotPassword(context),
                    const SizedBox(height: 15),
                    _buildSignInButton(),
                  ],
                ),

                //Bottom part
                Column(children: [Divider(), AppVersion()]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildForgotPassword(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () => context.go(RouteNames.recoverPassword),
          child: const Text(
            "¿Olvidaste tu contraseña?",
            style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
              decorationColor: Colors.blue,
              decorationThickness: 0.8,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  BlocConsumer<AuthBloc, AuthState> _buildSignInButton() {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailureState) {
          ToastMessageUtil.showToast(state.message, context);
        }

        if (state is AuthSuccessState) {
          context.go(RouteNames.authWrapper);
        }
      },
      builder: (context, state) {
        return CustomButton(
          onTap:
              state is AuthLoadingState
                  ? () {}
                  : () {
                    if (formKey.currentState?.validate() ?? false) {
                      if (mounted) {
                        context.read<AuthBloc>().add(
                          AuthSignInEvent(
                            email:
                                emailTextController.text.trim().toLowerCase(),
                            password: passwordTextController.text.trim(),
                          ),
                        );
                      }
                    }
                  },
          child:
              state is AuthLoadingState
                  ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                      strokeWidth: 2,
                    ),
                  )
                  : Text("Iniciar sesión"),
        );
      },
    );
  }
}

class TrueInverseRoundedClipper extends CustomClipper<Path> {
  final double radius;
  final double verticalPosition; // 0 to 100 (%)

  TrueInverseRoundedClipper({this.radius = 30, required this.verticalPosition});

  @override
  Path getClip(Size size) {
    final path = Path();
    final y = (verticalPosition.clamp(0, 100) / 100) * size.height;
    path.lineTo(0, y);

    final firstControl = Offset(0, y - 20);
    final firstEnd = Offset(radius, y - 20);
    path.quadraticBezierTo(
      firstControl.dx,
      firstControl.dy,
      firstEnd.dx,
      firstEnd.dy,
    );

    final rightStart = Offset(size.width - radius, y - 20);
    path.lineTo(rightStart.dx, rightStart.dy);

    final secondControl = Offset(size.width, y - 20);
    final secondEnd = Offset(size.width, y);
    path.quadraticBezierTo(
      secondControl.dx,
      secondControl.dy,
      secondEnd.dx,
      secondEnd.dy,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant TrueInverseRoundedClipper oldClipper) {
    return oldClipper.verticalPosition != verticalPosition ||
        oldClipper.radius != radius;
  }
}
