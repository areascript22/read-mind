import 'package:client_app/core/common/widget/custom_button.dart';
import 'package:client_app/core/routing/route_names.dart';
import 'package:client_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:client_app/features/auth/presentation/pages/sign_in_page.dart';
import 'package:client_app/shared/widgets/loader_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/common/utils/toast_util.dart';
import '../widgets/auth_password_textfield.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/background1.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final nameTextController = TextEditingController();
  final lastnameTectController = TextEditingController();
  final formKey = GlobalKey<FormState>(); // Form key for validation
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: TrueInverseRoundedClipper(verticalPosition: 100),
              child: Container(
                // padding: EdgeInsets.all(10),
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

  Form _buildForm(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 370,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 14, bottom: 30),
                    child: Row(
                      children: [
                        const Text(
                          "¿Yá tienes una cuenta? ",
                          style: TextStyle(fontSize: 15),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.go(RouteNames.signIn);
                          },
                          child: const Text(
                            "Iniciar sesión",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Name and Lastname
                  Row(
                    children: [
                      Expanded(
                        child: AuthTextField(
                          hintText: "Nombre",
                          textEditingController: nameTextController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, ingresa tu nombre'; // Required validation
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: AuthTextField(
                          hintText: "Apellido",
                          textEditingController: lastnameTectController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, ingresa tu apellido'; // Required validation
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  AuthTextField(
                    textInputType: TextInputType.emailAddress,
                    textEditingController: emailTextController,
                    hintText: 'Correo electrónico',
                    validator: (value) {
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
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  AuthPasswordTextfield(
                    textEditingController: passwordTextController,
                    isObscureText: true,
                    hintText: 'Contraseña',
                    validator: (value) {
                      value = value?.trim();
                      passwordTextController.text =
                          passwordTextController.text.trim();
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese su contraseña';
                      }
                      if (value.length < 8) {
                        return 'La contraseña debe tener al menos 8 caracteres';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  BlocConsumer<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return CustomButton(
                        onTap:
                            state is AuthLoadingState
                                ? () {}
                                : () {
                                  context.read<AuthBloc>().add(
                                    AuthSignUpEvent(
                                      email:
                                          emailTextController.text
                                              .trim()
                                              .toLowerCase(),
                                      password:
                                          passwordTextController.text.trim(),
                                      name: nameTextController.text.trim(),
                                      lastName:
                                          lastnameTectController.text.trim(),
                                    ),
                                  );
                                },
                        child:
                            state is AuthLoadingState
                                ? const LoaderIndicator(
                                  spinnerColor: Colors.blueAccent,
                                )
                                : const Text("Continuar"),
                      );
                    },
                    listener: (context, state) {
                      if (state is AuthFailureState) {
                        ToastMessageUtil.showToast(state.message, context);
                      }

                      if (state is AuthSuccessState) {
                        context.go(RouteNames.authWrapper);
                      }
                    },
                  ),
                ],
              ),
              _buildVersionInfoSection(),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildVersionInfoSection() =>
      Column(children: [Divider(), Text("sharedViewModel.version")]);
}
