import 'package:client_app/core/common/utils/toast_util.dart';
import 'package:client_app/features/home/children/users/presentation/bloc/user_manager_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:client_app/core/common/entities/user_entity.dart';
import 'package:client_app/core/common/enums/user_roles.dart';
import '../../../../../../core/common/cubits/app_user/app_user_cubit.dart';
import '../../../../../../init_dependencies.dart';

Future<void> showUserInfoDialog(BuildContext context, UserEntity user) async {
  await showDialog(
    context: context,
    builder:
        (_) => BlocProvider.value(
          value: serviceLocator<UserManagerBloc>(),
          child: DialogShowUserInfo(user: user),
        ),
  );
}

class DialogShowUserInfo extends StatefulWidget {
  final UserEntity user;
  const DialogShowUserInfo({super.key, required this.user});

  @override
  State<DialogShowUserInfo> createState() => _DialogShowUserInfoState();
}

class _DialogShowUserInfoState extends State<DialogShowUserInfo> {
  late String _selectedRole;
  late bool _canChangeRole;
  late List<String> _availableRoles;

  @override
  void initState() {
    super.initState();
    _setupRolePermissions();
  }

  void _setupRolePermissions() {
    final currentUser =
        BlocProvider.of<AppUserCubit>(context, listen: false).user;
    _selectedRole = widget.user.role.name;

    if (currentUser == null) {
      _canChangeRole = false;
      _availableRoles = [];
      return;
    }

    final currentRole = currentUser.role.name;
    final userRole = widget.user.role.name;

    if (currentRole == UserRoles.admin.name) {
      _canChangeRole =
          userRole == UserRoles.student.name ||
          userRole == UserRoles.professor.name;
      _availableRoles = [UserRoles.student.name, UserRoles.professor.name];
    } else if (currentRole == UserRoles.superUser.name) {
      _canChangeRole = userRole != UserRoles.superUser.name;
      _availableRoles = [
        UserRoles.student.name,
        UserRoles.professor.name,
        UserRoles.admin.name,
      ];
    } else {
      _canChangeRole = false;
      _availableRoles = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = widget.user;

    return BlocConsumer<UserManagerBloc, UserManagerState>(
      listener: (context, state) {
        if (state is UserRoleUpdatedState) {
          ToastMessageUtil.showToast("Rol actualizado correctamente", context);
          Navigator.pop(context);
        } else if (state is UserRoleUpdateErrorState) {
          ToastMessageUtil.showToast(state.message, context);
        }
      },
      builder: (context, state) {
        final isLoading = state is UserRoleUpdatingState;

        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: _buildDialogTitle(user),
          content: SingleChildScrollView(child: _buildDialogContent(user)),
          actions: _buildDialogActions(isLoading),
        );
      },
    );
  }

  Widget _buildDialogTitle(UserEntity user) {
    return Row(
      children: [
        const Icon(Icons.person, color: Colors.blueAccent),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            "${user.name} ${user.lastName}",
            style: const TextStyle(fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            softWrap: false,
          ),
        ),
      ],
    );
  }

  Widget _buildDialogContent(UserEntity user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoRow("Email", user.email),
        _buildInfoRow("Rol actual", user.role.name),
        _buildInfoRow(
          "Creado el",
          "${user.createdAt.day}/${user.createdAt.month}/${user.createdAt.year}",
        ),
        _buildInfoRow("Correo verificado", user.emailVerified ? "Sí" : "No"),
        const SizedBox(height: 12),
        if (_canChangeRole) _buildRoleDropdown(),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 2,
            child: Text(
              "$label: ",
              style: const TextStyle(fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Flexible(
            flex: 3,
            child: Text(value, overflow: TextOverflow.ellipsis, softWrap: true),
          ),
        ],
      ),
    );
  }

  Widget _buildRoleDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Cambiar rol:",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: _selectedRole,
          items:
              _availableRoles
                  .map((r) => DropdownMenuItem(value: r, child: Text(r)))
                  .toList(),
          onChanged: (value) {
            if (value != null) setState(() => _selectedRole = value);
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildDialogActions(bool isLoading) {
    return [
      TextButton(
        child: const Text("Cerrar"),
        onPressed: isLoading ? null : () => Navigator.pop(context),
      ),
      if (_canChangeRole)
        ElevatedButton(
          onPressed: isLoading ? null : _onSaveRole,
          child:
              isLoading
                  ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                  : const Text("Guardar"),
        ),
    ];
  }

  void _onSaveRole() {
    context.read<UserManagerBloc>().add(
      UpdateUserRoleEvent(
        targetUserId: widget.user.id.toString(),
        newRole: _selectedRole,
      ),
    );
  }
}
