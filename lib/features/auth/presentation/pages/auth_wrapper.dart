import 'package:client_app/core/common/utils/toast_util.dart';
import 'package:client_app/core/routing/route_names.dart';
import 'package:client_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:client_app/features/auth/presentation/cubit/app_version_cubit/app_version_cubit.dart';
import 'package:client_app/features/auth/presentation/widgets/dialog_email_not_verified.dart';
import 'package:client_app/features/auth/presentation/widgets/dialog_update_app.dart';
import 'package:client_app/shared/widgets/loader_indicator.dart';
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
    context.read<AppVersionCubit>().checkAppVersion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<AppVersionCubit, AppVersionState>(
            listener: (context, state) {
              if (state is AppVersionLoaded) {
                if (!state.isUpToDate) {
                  showUpdateAppDialog(context);
                } else {
                  context.read<AuthBloc>().add(AuthIsUserLoggedIn());
                }
              }
              if (state is AppVersionError) {
                ToastMessageUtil.showToast(state.message, context);
                context.read<AuthBloc>().add(AuthIsUserLoggedIn());
              }
            },
          ),
          BlocListener<AuthBloc, AuthState>(
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
          ),
        ],
        child: Center(child: LoaderIndicator()),
      ),
    );
  }
}
