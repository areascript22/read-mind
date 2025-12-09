import 'package:flutter/material.dart';

class CreateButton extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;
  const CreateButton({super.key, required this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: Colors.white.withValues(alpha: 0.25),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          splashColor: Colors.blue[100],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: child,
          ),
        ),
      ),
    );
  }
}
