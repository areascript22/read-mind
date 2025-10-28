import 'package:flutter/material.dart';

class MainIdeaTipDialog extends StatelessWidget {
  const MainIdeaTipDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 10,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.amber.shade200.withOpacity(0.5),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 🟡 Header (Amber gradient)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.amber.shade700, Colors.amber.shade400],
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Column(
                children: const [
                  Icon(
                    Icons.psychology_outlined,
                    color: Colors.white,
                    size: 40,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Consejos para identificar la idea principal",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // 🟡 Content
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: const [
                  _TipItem(
                    icon: Icons.search,
                    text:
                        "Lee todo el párrafo antes de intentar identificar la idea principal.",
                  ),
                  SizedBox(height: 12),
                  _TipItem(
                    icon: Icons.question_mark_outlined,
                    text:
                        "Pregúntate: ¿De qué trata principalmente este texto?",
                  ),
                  SizedBox(height: 12),
                  _TipItem(
                    icon: Icons.highlight_alt,
                    text:
                        "Busca frases que resumen el contenido general o se repiten con frecuencia.",
                  ),
                  SizedBox(height: 12),
                  _TipItem(
                    icon: Icons.compare,
                    text:
                        "Distingue entre detalles secundarios y el mensaje central.",
                  ),
                  SizedBox(height: 12),
                  _TipItem(
                    icon: Icons.lightbulb,
                    text:
                        "Intenta formular la idea principal con tus propias palabras en una sola oración.",
                  ),
                ],
              ),
            ),

            // 🟡 Button
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber.shade600,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 5,
                    shadowColor: Colors.amber.shade200,
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
}

// 🟡 Reusable Tip Item Widget
class _TipItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _TipItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: Colors.amber.shade100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.amber.shade700, size: 18),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              height: 1.4,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}

void showMainIdeaTipDialog(BuildContext context) {
  showDialog(context: context, builder: (context) => const MainIdeaTipDialog());
}
