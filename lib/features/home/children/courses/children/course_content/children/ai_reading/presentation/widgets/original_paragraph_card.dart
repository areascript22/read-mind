import 'package:flutter/material.dart';
import 'package:client_app/shared/widgets/buttons/copy_clipboard_button.dart';

class OriginalParagraphCard extends StatelessWidget {
  final String content;
  final bool isExpanded;
  final VoidCallback onToggle;

  const OriginalParagraphCard({
    super.key,
    required this.content,
    required this.isExpanded,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onToggle,
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blueAccent, width: 0.6),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Ver párrafo original",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Icon(
                  isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: Colors.blueAccent,
                ),
              ],
            ),
          ),
        ),

        AnimatedCrossFade(
          firstChild: const SizedBox.shrink(),
          secondChild: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 8, bottom: 16),
            padding: const EdgeInsets.all(12).copyWith(bottom: 0),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  content,
                  style: const TextStyle(fontSize: 15, height: 1.5),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: CopyButton(
                    textToCopy: content,
                  ),
                ),
              ],
            ),
          ),
          crossFadeState:
              isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 250),
        ),
      ],
    );
  }
}
