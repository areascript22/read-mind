import 'package:flutter/material.dart';

Future<void> showResetPasswordLink(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (_) => const _ResetPasswordSentDialog(),
  );
}

class _ResetPasswordSentDialog extends StatelessWidget {
  const _ResetPasswordSentDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0,
      backgroundColor: theme.colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.email_outlined,
                size: 42,
                color: theme.colorScheme.primary,
              ),
            ),

            const SizedBox(height: 20),

            // Title
            Text(
              "Revisa tu correo electrónico",
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 8),

            // Subtitle
            Text(
              "Te enviamos un enlace para restablecer tu contraseña. "
              "Revisa tu bandeja de entrada y sigue las instrucciones.",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 24),

            // Button
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("OK"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
