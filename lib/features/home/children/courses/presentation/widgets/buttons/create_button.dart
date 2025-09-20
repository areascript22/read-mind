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
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: child,
          ),
        ),
      ),
    );
  }
}
