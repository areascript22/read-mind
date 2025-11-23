import 'package:client_app/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/notifications_cubit/notifications_cubit.dart';

Future<bool> showNotificationPermissionsDialog({
  required BuildContext context,
  required VoidCallback onGrant,
  required VoidCallback onDeny,
}) async {
  final result = await showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder:
        (_) => BlocProvider.value(
          value: serviceLocator<NotificationsCubit>(),
          child: _NotificationPermissionsDialog(onGrant: onGrant),
        ),
  );

  return result ?? false;
}

class _NotificationPermissionsDialog extends StatefulWidget {
  final VoidCallback onGrant;
  const _NotificationPermissionsDialog({required this.onGrant});

  @override
  State<_NotificationPermissionsDialog> createState() =>
      _NotificationPermissionsDialogState();
}

class _NotificationPermissionsDialogState
    extends State<_NotificationPermissionsDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Enable Notifications",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: const Text(
        "To stay updated, please allow notifications for this app.",
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: const Text("Deny", style: TextStyle(color: Colors.red)),
        ),
        ElevatedButton(
          onPressed: () async {
            await context.read<NotificationsCubit>().requestPermissions();
            Navigator.of(context).pop(true);
          },
          child: const Text("Grant"),
        ),
      ],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }
}
