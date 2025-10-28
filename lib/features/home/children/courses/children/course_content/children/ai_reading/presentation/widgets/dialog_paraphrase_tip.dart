import 'package:flutter/material.dart';

class ParaphraseTipDialog extends StatelessWidget {
  const ParaphraseTipDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 10,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: colorScheme.primary.withValues(alpha: 0.2),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header with theme colors
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    colorScheme.primary,
                    colorScheme.primary.withOpacity(0.8),
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.lightbulb_outline,
                    color: colorScheme.onPrimary,
                    size: 40,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Consejos para parafrasear",
                    style: TextStyle(
                      color: colorScheme.onPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  _buildTipItem(
                    icon: Icons.visibility,
                    text: "Lee el párrafo con atención",
                    colorScheme: colorScheme,
                  ),
                  const SizedBox(height: 12),
                  _buildTipItem(
                    icon: Icons.swap_horiz,
                    text:
                        "Usa sinónimos y cambia la estructura de las oraciones",
                    colorScheme: colorScheme,
                  ),
                  const SizedBox(height: 12),
                  _buildTipItem(
                    icon: Icons.import_export,
                    text: "Mantén el significado original",
                    colorScheme: colorScheme,
                  ),
                  const SizedBox(height: 12),
                  _buildTipItem(
                    icon: Icons.content_copy,
                    text: "Evita copiar frases textuales",
                    colorScheme: colorScheme,
                  ),
                  const SizedBox(height: 12),
                  _buildTipItem(
                    icon: Icons.brush,
                    text: "Utiliza tu propio estilo y vocabulario",
                    colorScheme: colorScheme,
                  ),
                ],
              ),
            ),

            // Button
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 5,
                    shadowColor: colorScheme.primary.withOpacity(0.3),
                  ),
                  child: const Text(
                    "Entendido",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTipItem({
    required IconData icon,
    required String text,
    required ColorScheme colorScheme,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: colorScheme.primary, size: 18),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              height: 1.4,
              color: colorScheme.onSurface,
            ),
          ),
        ),
      ],
    );
  }
}

void showParaphraseTipDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const ParaphraseTipDialog(),
  );
}
