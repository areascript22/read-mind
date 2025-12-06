import 'package:client_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:client_app/core/common/entities/user_entity.dart';
import 'package:client_app/core/common/enums/user_roles.dart';
import 'package:client_app/core/common/utils/toast_util.dart';
import 'package:client_app/core/common/widget/custom_button.dart';
import 'package:client_app/core/routing/route_names.dart';
import 'package:client_app/features/home/children/profile/presentation/bloc/profile_bloc.dart';
import 'package:client_app/features/home/children/profile/presentation/widgets/dialog_log_out.dart';
import 'package:client_app/features/home/children/profile/presentation/widgets/dialog_request_role.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../../init_dependencies.dart';

class UserProfilePage extends StatelessWidget {
  final UserEntity user;

  const UserProfilePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: serviceLocator<ProfileBloc>(),
      child: _UserProfileBody(user: user),
    );
  }
}

class _UserProfileBody extends StatelessWidget {
  final UserEntity user;

  const _UserProfileBody({required this.user});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final formattedDate = DateFormat('dd/MM/yyyy').format(user.createdAt);
    final userCubit = context.read<AppUserCubit>();

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: CustomScrollView(
        slivers: [
          // Header con avatar
          SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [colorScheme.primary, colorScheme.primaryContainer],
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Avatar
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colorScheme.onPrimary.withOpacity(0.2),
                          border: Border.all(
                            color: colorScheme.onPrimary,
                            width: 3,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "${user.name[0]}${user.lastName[0]}".toUpperCase(),
                            style: theme.textTheme.headlineMedium?.copyWith(
                              color: colorScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Nombre
                      Text(
                        "${user.name} ${user.lastName}",
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: colorScheme.onPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Rol con badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.onPrimary.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          user.role.name,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onPrimary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Contenido
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    // Información personal
                    _buildInfoSection(theme, colorScheme, formattedDate),

                    // Solicitud de rol (si es profesor)
                    if (userCubit.isProfessor) ...[
                      const SizedBox(height: 24),
                      _buildRoleRequestSection(context, theme, colorScheme),
                    ],

                    // Estado de verificación de email
                    const SizedBox(height: 24),
                    _buildEmailVerificationStatus(theme, colorScheme),

                    // Botón de cerrar sesión
                    const SizedBox(height: 32),
                    _buildLogoutButton(context, theme, colorScheme),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection(
    ThemeData theme,
    ColorScheme colorScheme,
    String formattedDate,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Información Personal",
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoRow(
            Icons.email_rounded,
            "Correo Electrónico",
            user.email,
            theme,
            colorScheme,
          ),
          const SizedBox(height: 12),
          _buildInfoRow(
            Icons.calendar_month_rounded,
            "Fecha de Registro",
            formattedDate,
            theme,
            colorScheme,
          ),
          const SizedBox(height: 12),
          _buildInfoRow(
            Icons.verified_user_rounded,
            "Estado de la Cuenta",
            user.emailVerified ? "Verificada" : "Pendiente de verificación",
            theme,
            colorScheme,
            valueColor: user.emailVerified ? Colors.green : Colors.orange,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
    IconData icon,
    String title,
    String value,
    ThemeData theme,
    ColorScheme colorScheme, {
    Color? valueColor,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 20, color: colorScheme.primary),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: valueColor ?? colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRoleRequestSection(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileRequestRoleSuccess) {
          ToastMessageUtil.showToast(
            'Solicitud enviada correctamente',
            context,
          );
        } else if (state is ProfileRequestRoleError) {
          ToastMessageUtil.showToast(state.message, context);
        }
      },
      builder: (context, state) {
        final isLoading = state is ProfileRequestRoleLoading;

        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: colorScheme.primary.withOpacity(0.2),
              width: 2,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.workspace_premium_rounded,
                      size: 20,
                      color: colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "Mejorar Rol de Usuario",
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                "Solicita acceso como administrador para gestionar cursos y usuarios del sistema.",
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:
                      isLoading
                          ? null
                          : () async {
                            final response = await showDialogRequestRole(
                              context: context,
                              roleName: UserRoles.admin.name,
                            );
                            if (response && context.mounted) {
                              context.read<ProfileBloc>().add(
                                ProfileRequestRoleEvent(UserRoles.admin.id),
                              );
                            }
                          },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child:
                      isLoading
                          ? SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: colorScheme.onPrimary,
                            ),
                          )
                          : Text(
                            "Solicitar Rol de Administrador",
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEmailVerificationStatus(
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color:
            user.emailVerified
                ? Colors.green.withOpacity(0.1)
                : Colors.orange.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color:
              user.emailVerified
                  ? Colors.green.withOpacity(0.3)
                  : Colors.orange.withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          Icon(
            user.emailVerified
                ? Icons.verified_rounded
                : Icons.warning_amber_rounded,
            color: user.emailVerified ? Colors.green : Colors.orange,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.emailVerified
                      ? "Correo Verificado"
                      : "Verificación Pendiente",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  user.emailVerified
                      ? "Tu dirección de correo ha sido verificada correctamente."
                      : "Por favor verifica tu dirección de correo electrónico.",
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutButton(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return CustomButton(
      onTap: () async {
        final response = await showDialogLogout(context: context);
        if (response && context.mounted) {
          context.read<AppUserCubit>().logout();
          context.go(RouteNames.splashScreen);
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.logout_rounded, size: 20, color: colorScheme.onError),
          const SizedBox(width: 8),
          Text(
            "Cerrar Sesión",
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: colorScheme.onError,
            ),
          ),
        ],
      ),
    );
  }
}
