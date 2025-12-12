import 'package:flutter/material.dart';

class DialogSummaryTip extends StatelessWidget {
  const DialogSummaryTip({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.white,
      title: const Text(
        '📝 Consejos de Resumen',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
      ),
      content: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '✨ ¿Qué es un resumen?',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Un resumen es una versión corta de un texto que incluye únicamente las ideas principales y los detalles esenciales.',
            ),
            SizedBox(height: 16),
            Text(
              '💡 Cómo hacer un buen resumen:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text('• Identifica la idea principal del texto.'),
            Text('• Excluye ejemplos o repeticiones innecesarias.'),
            Text('• Usa tus propias palabras para expresar los puntos clave.'),
            Text('• Mantén el resumen breve y coherente.'),
            Text('• Conserva el significado y tono original del texto.'),
            SizedBox(height: 16),
            Text(
              '📘 Ejemplo:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '"Texto original: La Revolución Industrial comenzó en Gran Bretaña y se extendió a otros países, transformando industrias y sociedades."',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 8),
            Text(
              '"Resumen: La Revolución Industrial comenzó en Gran Bretaña y cambió las industrias a nivel global."',
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

void showSummaryTips(BuildContext context) {
  showDialog(context: context, builder: (context) => const DialogSummaryTip());
}
