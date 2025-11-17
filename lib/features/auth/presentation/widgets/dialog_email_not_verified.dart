import 'package:client_app/core/common/entities/user_entity.dart';
import 'package:flutter/material.dart';

void showEmailNoVerificadoDialog(BuildContext context, UserEntity userEntity) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => EmailNoVerificadoDialog(userEntity: userEntity),
  );
}

class EmailNoVerificadoDialog extends StatelessWidget {
  final UserEntity userEntity;
  const EmailNoVerificadoDialog({super.key, required this.userEntity});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 8,
      backgroundColor: theme.colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: primary.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.mail_lock_rounded,
                    color: primary,
                    size: 50,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Correo no verificado",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                const Text(
                  "Tu dirección de correo electrónico aún no ha sido verificada. "
                  "Por favor, revisa tu bandeja de entrada y haz clic en el enlace "
                  "de verificación que te enviamos.",
                  style: TextStyle(fontSize: 15, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceVariant.withValues(
                      alpha: 0.4,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: theme.dividerColor),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.email_outlined, color: Colors.grey),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          userEntity.email,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
              ],
            ),

            Positioned(
              top: -10,
              right: -10,
              child: IconButton(
                icon: const Icon(Icons.close_rounded, size: 30),
                color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                onPressed: () => Navigator.pop(context),
                tooltip: "Cerrar",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
