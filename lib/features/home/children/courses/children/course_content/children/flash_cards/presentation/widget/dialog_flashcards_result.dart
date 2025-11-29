import 'package:client_app/core/common/widget/custom_button.dart';
import 'package:client_app/core/common/widget/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import '../../domain/entity/flashcard_session_entity.dart';

Future<bool> showFlashCardResultsDialog({
  required BuildContext context,
  required FlashcardSessionEntity session,
}) {
  return showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return _FlashCardResultsDialog(session: session);
    },
  ).then((value) => value ?? false);
}

class _FlashCardResultsDialog extends StatelessWidget {
  final FlashcardSessionEntity session;

  const _FlashCardResultsDialog({required this.session});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final double accuracy =
        session.cardsCompleted > 0
            ? (session.correctAnswers / session.cardsCompleted * 100)
            : 0;
    final double averageTimePerCard =
        session.cardsCompleted > 0
            ? session.totalTimeSec / session.cardsCompleted
            : 0;

    return Dialog(
      backgroundColor: colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 400,
          maxHeight: MediaQuery.of(context).size.height * 0.8,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.celebration_rounded,
                      color: colorScheme.primary,
                      size: 28, // ← REDUCE TAMAÑO DEL ICONO
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        '¡Sesión Completada!',
                        style: theme.textTheme.titleLarge?.copyWith(
                          // ← USA TITLE LARGE EN LUGAR DE HEADLINE
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _buildStatsSection(
                  theme,
                  colorScheme,
                  accuracy,
                  averageTimePerCard,
                ),
                const SizedBox(height: 24),
                _buildAccuracyBar(theme, colorScheme, accuracy, context),
                const SizedBox(height: 24),
                _buildActionButtons(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatsSection(
    ThemeData theme,
    ColorScheme colorScheme,
    double accuracy,
    double averageTimePerCard,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.2)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              _buildStatItem(
                icon: Icons.check_circle_rounded,
                value: session.correctAnswers.toString(),
                label: 'Correctas',
                color: Colors.green,
                theme: theme,
              ),
              const SizedBox(width: 12),
              _buildStatItem(
                icon: Icons.cancel_rounded,
                value: session.incorrectAnswers.toString(),
                label: 'Incorrectas',
                color: Colors.orange,
                theme: theme,
              ),
            ],
          ),

          const SizedBox(height: 12), // ← REDUCE ESPACIADO
          // Segunda fila de stats
          Row(
            children: [
              _buildStatItem(
                icon: Icons.timer_rounded,
                value: '${session.totalTimeSec}s',
                label: 'Tiempo Total',
                color: Colors.blue,
                theme: theme,
              ),
              const SizedBox(width: 12), // ← REDUCE ESPACIADO
              _buildStatItem(
                icon: Icons.av_timer_rounded,
                value: '${averageTimePerCard.toStringAsFixed(1)}s',
                label: 'Promedio/Card',
                color: Colors.purple,
                theme: theme,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required String value,
    required String label,
    required Color color,
    required ThemeData theme,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withValues(alpha: 0.2)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 18),
            const SizedBox(height: 4),
            Text(
              value,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccuracyBar(
    ThemeData theme,
    ColorScheme colorScheme,
    double accuracy,
    BuildContext context,
  ) {
    Color accuracyColor;
    String accuracyText;

    if (accuracy >= 80) {
      accuracyColor = Colors.green;
      accuracyText = '¡Excelente!';
    } else if (accuracy >= 60) {
      accuracyColor = Colors.orange;
      accuracyText = 'Buen trabajo';
    } else {
      accuracyColor = Colors.red;
      accuracyText = 'Sigue practicando';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Precisión',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
            Text(
              '${accuracy.toStringAsFixed(1)}%',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: accuracyColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 10,
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),

              FractionallySizedBox(
                widthFactor: accuracy / 100,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [accuracyColor, accuracyColor.withOpacity(0.8)],
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 8),

        Text(
          accuracyText,
          style: theme.textTheme.bodySmall?.copyWith(
            color: accuracyColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomOutlinedButton(
            onTap: () {
              Navigator.of(context).pop(false);
            },
            icon: Icon(
              Icons.refresh_rounded,
              size: 18,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            child: Text(
              'Reintentar',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SizedBox(width: 5),
        Expanded(
          child: CustomButton(
            onTap: () {
              Navigator.of(context).pop(true);
            },
            icon: Icon(
              Icons.check_circle_rounded,
              size: 18,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            child: Text(
              'Finalizar',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
