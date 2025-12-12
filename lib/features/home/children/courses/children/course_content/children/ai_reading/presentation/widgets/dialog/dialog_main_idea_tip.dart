import 'package:flutter/material.dart';

class MainIdeaTipDialog extends StatelessWidget {
  const MainIdeaTipDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.white,
      title: const Text(
        '💡 Consejos de Idea Principal',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
      ),
      content: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '✨ ¿Qué es la idea principal?',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'La idea principal es el concepto más importante que el autor quiere comunicar. Es el mensaje central alrededor del cual gira todo el texto.',
            ),
            SizedBox(height: 16),
            Text(
              '🔍 Cómo identificar la idea principal:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text('• Lee todo el párrafo completamente antes de analizar.'),
            Text('• Pregúntate: ¿De qué trata principalmente este texto?'),
            Text('• Busca frases que resuman el contenido general.'),
            Text(
              '• Distingue entre detalles secundarios y el mensaje central.',
            ),
            Text('• Identifica conceptos que se repiten con frecuencia.'),
            Text('• Formula la idea principal con tus propias palabras.'),
            SizedBox(height: 16),
            Text(
              '📘 Ejemplo:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '"Texto original: La práctica regular de ejercicio físico no solo mejora la salud cardiovascular y fortalece los músculos, sino que también reduce el estrés y aumenta los niveles de energía durante el día."',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 8),
            Text(
              '"Idea principal: El ejercicio regular ofrece múltiples beneficios para la salud física y mental."',
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

void showMainIdeaTipDialog(BuildContext context) {
  showDialog(context: context, builder: (context) => const MainIdeaTipDialog());
}
