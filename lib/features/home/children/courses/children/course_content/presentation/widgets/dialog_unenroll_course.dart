import 'package:flutter/material.dart';

Future<bool> showDialogLeaveCourse({
  required BuildContext context,
  String? courseName,
  String? teacherName,
}) async {
  final result = await showDialog<bool>(
    context: context,
    barrierDismissible: true,
    builder: (ctx) {
      return Dialog(
        backgroundColor: Theme.of(ctx).colorScheme.surface,
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: LeaveCourseDialogContent(
          courseName: courseName,
          teacherName: teacherName,
        ),
      );
    },
  );

  return result ?? false;
}

class LeaveCourseDialogContent extends StatelessWidget {
  final String? courseName;
  final String? teacherName;

  const LeaveCourseDialogContent({
    super.key,
    this.courseName,
    this.teacherName,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with warning icon
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: colorScheme.errorContainer,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.exit_to_app_rounded,
                  color: colorScheme.onErrorContainer,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                "Abandonar Curso",
                style: theme.textTheme.titleLarge?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Course information
          if (courseName != null) ...[
            Text(
              "Curso:",
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurface.withOpacity(0.6),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              courseName!,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
          ],

          if (teacherName != null) ...[
            Text(
              "Profesor:",
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurface.withOpacity(0.6),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              teacherName!,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface.withOpacity(0.8),
              ),
            ),
            const SizedBox(height: 16),
          ],

          // Warning message
          Text(
            "¿Estás seguro de que deseas abandonar este curso?",
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurface.withOpacity(0.8),
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 8),

          // Consequences
          _buildConsequenceItem(
            "Perderás acceso a todos los materiales del curso",
            theme,
            colorScheme,
          ),
          const SizedBox(height: 6),
          _buildConsequenceItem(
            "Se eliminará tu progreso y calificaciones",
            theme,
            colorScheme,
          ),
          const SizedBox(height: 6),
          _buildConsequenceItem(
            "No podrás volver a unirte sin un nuevo código de invitación",
            theme,
            colorScheme,
          ),

          const SizedBox(height: 24),

          // Actions
          Row(
            children: [
              // Cancel button
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: colorScheme.onSurface.withOpacity(0.7),
                    side: BorderSide(
                      color: colorScheme.outline.withOpacity(0.5),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: Text(
                    "Cancelar",
                    style: TextStyle(
                      color: colorScheme.onSurface.withOpacity(0.8),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // Leave course button
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.error,
                    foregroundColor: colorScheme.onError,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: Text(
                    "Abandonar",
                    style: TextStyle(
                      color: colorScheme.onError,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildConsequenceItem(
    String text,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 6, right: 8),
          child: Icon(
            Icons.remove_rounded,
            size: 16,
            color: colorScheme.error.withOpacity(0.7),
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
        ),
      ],
    );
  }
}
