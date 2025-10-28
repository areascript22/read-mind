import 'package:flutter/material.dart';

class ParaphraseTipDialog extends StatelessWidget {
  const ParaphraseTipDialog({super.key});

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
              color: Colors.amber.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 🔶 Header with amber gradient
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.amber,
                    Color(0xFFFFC107), // Amber accent
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Column(
                children: const [
                  Icon(Icons.lightbulb_outline, color: Colors.white, size: 40),
                  SizedBox(height: 10),
                  Text(
                    "Consejos para parafrasear",
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
                    icon: Icons.visibility,
                    text: "Lee el párrafo con atención",
                  ),
                  SizedBox(height: 12),
                  _TipItem(
                    icon: Icons.swap_horiz,
                    text:
                        "Usa sinónimos y cambia la estructura de las oraciones",
                  ),
                  SizedBox(height: 12),
                  _TipItem(
                    icon: Icons.import_export,
                    text: "Mantén el significado original",
                  ),
                  SizedBox(height: 12),
                  _TipItem(
                    icon: Icons.content_copy,
                    text: "Evita copiar frases textuales",
                  ),
                  SizedBox(height: 12),
                  _TipItem(
                    icon: Icons.brush,
                    text: "Utiliza tu propio estilo y vocabulario",
                  ),
                ],
              ),
            ),

            // 🟠 Button
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 5,
                    shadowColor: Colors.amberAccent.withOpacity(0.5),
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
            color: Colors.amber.withOpacity(0.15),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.amber, size: 18),
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

void showParaphraseTipDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const ParaphraseTipDialog(),
  );
}
