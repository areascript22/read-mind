import 'package:client_app/core/routing/route_names.dart';
import 'package:client_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:client_app/features/auth/presentation/widgets/dialog_email_not_verified.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthIsUserLoggedIn());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(child: CircularProgressIndicator(color: Colors.red)),
        );
      },
      listener: (context, state) {
        if (state is AuthFailureState) {
          context.go(RouteNames.signIn);
        }
        if (state is AuthSuccessState) {
          final user = state.userEntity;
          if (user.emailVerified) {
            context.go(RouteNames.home);
            return;
          }
          showEmailNoVerificadoDialog(context, user);
          context.go(RouteNames.signIn);
        }
      },
    );
  }
}
