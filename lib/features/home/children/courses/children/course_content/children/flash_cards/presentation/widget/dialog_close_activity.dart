import 'package:client_app/core/common/widget/custom_button.dart';
import 'package:client_app/core/common/widget/custom_outlined_button.dart';
import 'package:client_app/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/flashcard_bloc/flash_card_bloc.dart';

Future<bool?> showExitFlashCardDialog({
  required BuildContext context,
  required int sessionId,
}) async {
  return showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder:
        (context) => BlocProvider.value(
          value: serviceLocator<FlashCardBloc>(),
          child: ExitFlashCardDialog(sessionId: sessionId),
        ),
  );
}

class ExitFlashCardDialog extends StatefulWidget {
  final int sessionId;
  const ExitFlashCardDialog({super.key, required this.sessionId});

  @override
  State<ExitFlashCardDialog> createState() => _ExitFlashCardDialogState();
}

class _ExitFlashCardDialogState extends State<ExitFlashCardDialog> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.exit_to_app_rounded,
                  size: 32,
                  color: colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '¿Salir de la actividad?',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              'Tu progreso actual se guardará automáticamente. '
              'Podrás retomar desde este punto más tarde.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.7),
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: CustomOutlinedButton(
                    onTap: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text(
                      'Cancelar',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomButton(
                    onTap: () {
                      context.read<FlashCardBloc>().add(
                        FlashCardCompleteSession(sessionId: widget.sessionId),
                      );
                      Navigator.of(context).pop(true);
                    },
                    child: Text(
                      'Aceptar',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: colorScheme.onPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
