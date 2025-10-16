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
    final formattedDate = DateFormat('dd/MM/yyyy').format(user.createdAt);
    final userCubit = context.read<AppUserCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil del Usuario"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blueAccent,
              child: Text(
                "${user.name[0]}${user.lastName[0]}".toUpperCase(),
                style: const TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "${user.name} ${user.lastName}",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Chip(
              label: Text(
                user.role.name,
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.blueAccent,
            ),
            const SizedBox(height: 24),
            _infoTile(Icons.email, "Correo electrónico", user.email),
            _infoTile(Icons.calendar_today, "Creado el", formattedDate),

            BlocConsumer<ProfileBloc, ProfileState>(
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
                if (state is ProfileRequestRoleLoading) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                return Column(
                  children: [
                    if (userCubit.isStudent)
                      _roleRequestCard(
                        "Conviértete en Profesor",
                        Icons.school,
                        onTap:
                            state is! ProfileRequestRoleLoading
                                ? () async {
                                  final response = await showDialogRequestRole(
                                    context: context,
                                    roleName: UserRoles.professor.name,
                                  );
                                  if (response && context.mounted) {
                                    context.read<ProfileBloc>().add(
                                      ProfileRequestRoleEvent(
                                        UserRoles.professor.id,
                                      ),
                                    );
                                  }
                                }
                                : () {},
                      ),
                    if (userCubit.isProfessor)
                      _roleRequestCard(
                        "Conviértete en Administrador",
                        Icons.verified_user,
                        onTap:
                            state is! ProfileRequestRoleLoading
                                ? () async {
                                  final response = await showDialogRequestRole(
                                    context: context,
                                    roleName: UserRoles.admin.name,
                                  );
                                  if (response && context.mounted) {
                                    context.read<ProfileBloc>().add(
                                      ProfileRequestRoleEvent(
                                        UserRoles.admin.id,
                                      ),
                                    );
                                  }
                                }
                                : () {},
                      ),
                  ],
                );
              },
            ),

            const SizedBox(height: 25),
            CustomButton(
              onTap: () async {
                final response = await showDialogLogout(context: context);
                if (response && context.mounted) {
                  context.read<AppUserCubit>().logout();
                  context.go(RouteNames.splashScreen);
                }
              },
              child: const Text("Cerrar sesión"),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _infoTile(IconData icon, String title, String value) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(title),
        subtitle: Text(value),
      ),
    );
  }

  static Widget _roleRequestCard(
    String text,
    IconData icon, {
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: Colors.blueAccent, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.grey,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
