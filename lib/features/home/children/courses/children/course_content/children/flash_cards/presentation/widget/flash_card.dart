import 'package:client_app/core/common/utils/date_util.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../domain/entity/translation_entity.dart';

class FlashCard extends StatefulWidget {
  final TranslationEntity translation;
  final bool isAnswered;
  final String userAnswer;
  final bool isCorrect;
  final int? timeSpent; // ← NUEVO PARÁMETRO

  const FlashCard({
    super.key,
    required this.translation,
    required this.isAnswered,
    required this.userAnswer,
    required this.isCorrect,
    this.timeSpent, // ← NUEVO PARÁMETRO OPCIONAL
  });

  @override
  State<FlashCard> createState() => _FlashCardState();
}

class _FlashCardState extends State<FlashCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      decoration: BoxDecoration(
        gradient:
            widget.isAnswered
                ? LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors:
                      widget.isCorrect
                          ? [
                            Colors.green.shade50,
                            Colors.green.shade100.withOpacity(0.7),
                          ]
                          : [
                            Colors.orange.shade50,
                            Colors.orange.shade100.withOpacity(0.7),
                          ],
                )
                : LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    colorScheme.surface,
                    colorScheme.surface.withOpacity(0.95),
                  ],
                ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color:
                widget.isAnswered
                    ? (widget.isCorrect ? Colors.green : Colors.orange)
                        .withOpacity(0.15)
                    : colorScheme.shadow.withOpacity(0.1),
            blurRadius: 24,
            spreadRadius: 2,
            offset: const Offset(0, 6),
          ),
        ],
        border: Border.all(
          color:
              widget.isAnswered
                  ? (widget.isCorrect ? Colors.green : Colors.orange)
                      .withOpacity(0.3)
                  : colorScheme.outline.withOpacity(0.1),
          width: 2,
        ),
      ),
      child: Stack(
        children: [
          if (widget.isAnswered)
            Positioned(
              top: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: widget.isCorrect ? Colors.green : Colors.orange,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: (widget.isCorrect ? Colors.green : Colors.orange)
                          .withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      widget.isCorrect ? Icons.check_circle : Icons.info,
                      color: Colors.white,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      widget.isCorrect ? 'Correcto' : 'Revisado',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          // NUEVO: Badge de tiempo en la esquina superior izquierda
          if (widget.isAnswered && widget.timeSpent != null)
            Positioned(
              top: 16,
              left: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.timer_rounded, color: Colors.white, size: 14),
                    const SizedBox(width: 4),
                    Text(
                      '${widget.timeSpent}s',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(32),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Language badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: colorScheme.primary.withOpacity(0.2),
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.language_rounded,
                          color: colorScheme.primary,
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          widget.translation.sourceLang.toUpperCase(),
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Source text
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: colorScheme.primary.withOpacity(0.1),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      widget.translation.sourceText,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                        height: 1.3,
                        letterSpacing: 0.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Metadata
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildMetadataChip(
                        icon: Icons.repeat_rounded,
                        label: '${widget.translation.timesUsed}x',
                        colorScheme: colorScheme,
                        theme: theme,
                      ),
                      const SizedBox(width: 12),
                      _buildMetadataChip(
                        icon: Icons.calendar_today_rounded,
                        label: DateUtil.formatDateWithDays(
                          widget.translation.createdAt,
                        ),
                        colorScheme: colorScheme,
                        theme: theme,
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // Answer feedback
                  if (widget.isAnswered)
                    _buildAnswerFeedback(
                      widget.translation,
                      widget.userAnswer,
                      widget.isCorrect,
                      widget.timeSpent, // ← NUEVO: pasar tiempo al feedback
                      theme,
                      colorScheme,
                    )
                  else
                    _buildTranslatePrompt(theme, colorScheme),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetadataChip({
    required IconData icon,
    required String label,
    required ColorScheme colorScheme,
    required ThemeData theme,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: colorScheme.onSurfaceVariant),
          const SizedBox(width: 4),
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTranslatePrompt(ThemeData theme, ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.primary.withOpacity(0.2),
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.arrow_forward_rounded,
            color: colorScheme.primary,
            size: 20,
          ),
          const SizedBox(width: 12),
          Text(
            'Traduce al ${widget.translation.targetLang}',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnswerFeedback(
    TranslationEntity translation,
    String userAnswer,
    bool isCorrect,
    int? timeSpent, // ← NUEVO PARÁMETRO
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: (isCorrect ? Colors.green : Colors.orange).withOpacity(0.6),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: (isCorrect ? Colors.green : Colors.orange).withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: (isCorrect ? Colors.green : Colors.orange).withOpacity(
                    0.15,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  isCorrect
                      ? Icons.check_circle_rounded
                      : Icons.lightbulb_rounded,
                  color:
                      isCorrect
                          ? Colors.green.shade700
                          : Colors.orange.shade700,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isCorrect ? '¡Excelente!' : 'Respuesta correcta:',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color:
                            isCorrect
                                ? Colors.green.shade700
                                : Colors.orange.shade700,
                      ),
                    ),
                    if (!isCorrect) ...[
                      const SizedBox(height: 6),
                      Text(
                        translation.translated,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),

          // NUEVO: Información de tiempo en el feedback
          if (timeSpent != null) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.blueGrey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.blueGrey.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.timer_rounded, color: Colors.blueGrey, size: 16),
                  const SizedBox(width: 6),
                  Text(
                    'Tiempo: ${timeSpent}s',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Indicador de rendimiento basado en el tiempo
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: _getTimePerformanceColor(timeSpent),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      _getTimePerformanceText(timeSpent),
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 9,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],

          if (!isCorrect) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Text(
                    'Tu respuesta:',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      userAnswer,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Color _getTimePerformanceColor(int timeSpent) {
    if (timeSpent <= 5) return Colors.green;
    if (timeSpent <= 10) return Colors.orange;
    return Colors.red;
  }

  String _getTimePerformanceText(int timeSpent) {
    if (timeSpent <= 5) return 'RÁPIDO';
    if (timeSpent <= 10) return 'NORMAL';
    return 'LENTO';
  }
}
