import 'package:flutter/material.dart';

class ParaphraseTipDialog extends StatelessWidget {
  const ParaphraseTipDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.white,
      title: const Text(
        '🔄 Consejos de Paráfrasis',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
      ),
      content: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '✨ ¿Qué es parafrasear?',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Parafrasear es expresar las mismas ideas de un texto usando palabras diferentes, manteniendo el significado original pero con tu propio estilo.',
            ),
            SizedBox(height: 16),
            Text(
              '💡 Cómo parafrasear correctamente:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text('• Lee el texto original con atención y comprensión.'),
            Text('• Usa sinónimos y cambia la estructura de las oraciones.'),
            Text('• Mantén el significado y mensaje original del texto.'),
            Text('• Evita copiar frases textuales del original.'),
            Text('• Utiliza tu propio estilo y vocabulario personal.'),
            Text('• Verifica que no hayas cambiado la idea principal.'),
            SizedBox(height: 16),
            Text(
              '📘 Ejemplo:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '"Texto original: El cambio climático está afectando gravemente a los ecosistemas marinos y la biodiversidad oceánica."',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 8),
            Text(
              '"Paráfrasis: La diversidad biológica de los océanos y sus ecosistemas se ven seriamente impactados por las alteraciones del clima."',
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            '¡Entendido!',
            style: TextStyle(fontWeight: FontWeight.bold),
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
