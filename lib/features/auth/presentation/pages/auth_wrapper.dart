import 'package:client_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:client_app/core/common/features/preferences/presentation/cubit/preferences_cubit/preferences_cubit.dart';
import 'package:client_app/core/common/utils/toast_util.dart';
import 'package:client_app/core/routing/route_names.dart';
import 'package:client_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:client_app/features/auth/presentation/cubit/app_version_cubit/app_version_cubit.dart';
import 'package:client_app/features/auth/presentation/cubit/notifications_cubit/notifications_cubit.dart';
import 'package:client_app/features/auth/presentation/widgets/dialog_email_not_verified.dart';
import 'package:client_app/features/auth/presentation/widgets/dialog_notification_permissions.dart';
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

  void _onPreferencesLoaded(PreferencesLoaded state, int userId) async {
    if (!state.preferencesEntity.seenNotificationDialog) {
      final granted = await showNotificationPermissionsDialog(
        context: context,
        onGrant: () {},
        onDeny: () {},
      );

      if (mounted) {
        context.read<PreferencesCubit>().updateNotificationDialogSeen(
          userId: userId,
        );
      }
    }
    if (mounted) {
      context.read<NotificationsCubit>().updateFCMToken();
    }
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
                  context.go(RouteNames.signIn);
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
                  context.read<PreferencesCubit>().loadPreferences(
                    userId: state.userEntity.id,
                  );

                  return;
                }
                showEmailNoVerificadoDialog(context, user);
                context.go(RouteNames.signIn);
              }
            },
          ),

          BlocListener<PreferencesCubit, PreferencesState>(
            listener: (context, state) async {
              if (state is PreferencesError &&
                  state.preferenceAction == PreferenceAction.load) {
                context.go(RouteNames.home);
              }
              if (state is PreferencesLoaded &&
                  state.preferenceAction == PreferenceAction.load) {
                final userId = context.read<AppUserCubit>().user?.id ?? -1;
                _onPreferencesLoaded(state, userId);
              }
            },
          ),

          BlocListener<NotificationsCubit, NotificationsState>(
            listener: (context, state) {
              if (state is NotificationsTokenUpdated ||
                  state is NotificationsError) {
                context.go(RouteNames.home);
              }
            },
          ),
        ],
        child: Center(child: LoaderIndicator()),
      ),
    );
  }
}
