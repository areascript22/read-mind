import 'package:client_app/core/common/widget/custom_button.dart';
import 'package:flutter/material.dart';

Future<void> showNotEnoughTranslations(BuildContext context, int minLimit) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (_) => _NotEnoughTranslationsDialog(minLimit: minLimit),
  );
}

class _NotEnoughTranslationsDialog extends StatelessWidget {
  final int minLimit;

  const _NotEnoughTranslationsDialog({required this.minLimit});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: colorScheme.surface,
      elevation: 8,
      shadowColor: colorScheme.shadow.withOpacity(0.2),
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.translate_rounded,
                    size: 28,
                    color: colorScheme.primary,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.close_rounded,
                    size: 24,
                    color: colorScheme.onSurface.withOpacity(0.6),
                  ),
                  splashRadius: 20,
                  padding: const EdgeInsets.all(4),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              "Traducciones requeridas",
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
                height: 1.2,
              ),
            ),

            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: colorScheme.primaryContainer.withOpacity(0.5),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        size: 20,
                        color: colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Límite no alcanzado",
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  RichText(
                    text: TextSpan(
                      style: textTheme.bodyMedium?.copyWith(
                        height: 1.5,
                        color: colorScheme.onSurface.withOpacity(0.8),
                      ),
                      children: [
                        const TextSpan(
                          text:
                              "Para acceder a esta actividad necesitas completar al menos ",
                        ),
                        TextSpan(
                          text: "$minLimit traducciones",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.primary,
                          ),
                        ),
                        const TextSpan(
                          text:
                              ". Actualmente te faltan algunas por completar.",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colorScheme.surfaceVariant.withOpacity(0.4),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.rocket_launch_rounded,
                    size: 20,
                    color: colorScheme.secondary,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "¡No te rindas! Cada traducción te acerca más a dominar el idioma.",
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurface.withOpacity(0.7),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // BOTONES CORREGIDOS - Solución al right overflow
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    icon: Icon(
                      Icons.auto_awesome_rounded,
                      size: 20,
                      color: Colors.white70,
                    ),
                    onTap: () => Navigator.of(context).pop(),
                    child: Text(
                      "Entendido",
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.white70,
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
