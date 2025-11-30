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
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icono decorativo
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.notifications_active_rounded,
                size: 40,
                color: Colors.blue.shade600,
              ),
            ),

            const SizedBox(height: 20),

            // Título
            const Text(
              "Permitir Notificaciones",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 16),

            // Descripción
            const Text(
              "Mantente al día con tus actividades y recordatorios importantes. "
              "Te notificaremos sobre:\n\n"
              "• Fechas límite de actividades\n"
              "• Nuevos contenidos disponibles\n"
              "• Recordatorios de estudio\n"
              "• Logros y progreso",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                height: 1.4,
              ),
              textAlign: TextAlign.left,
            ),

            const SizedBox(height: 24),

            // Botones
            Row(
              children: [
                // Botón Denegar
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.red,
                      side: const BorderSide(color: Colors.red),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Ahora no",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      await context
                          .read<NotificationsCubit>()
                          .requestPermissions();
                      widget.onGrant();
                      if (context.mounted) {
                        Navigator.of(context).pop(true);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade600,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                    ),
                    child: const Text(
                      "Permitir",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Texto informativo adicional
            const Text(
              "Puedes cambiar esto después en Configuración",
              style: TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
