import 'package:flutter/material.dart';

class PlayBackbutton extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final String speed;

  const PlayBackbutton({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.speed,
  });

  @override
  Widget build(BuildContext context) {
    final color =
        isSelected
            ? Theme.of(context).colorScheme.primary
            : Colors.grey.shade300;
    final textColor = isSelected ? Colors.white : Colors.black87;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? Colors.transparent : Colors.grey.shade400,
          ),
        ),
        child: Text(
          speed,
          style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
