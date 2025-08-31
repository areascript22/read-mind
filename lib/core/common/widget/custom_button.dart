import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final void Function()? onTap;
  final Widget child;
  final Color? color;

  const CustomButton({
    super.key,
    required this.onTap,
    required this.child,
    this.color,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.color,
        shadowColor: Colors.blue,
      ),

      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [widget.child],
      ),
    );
  }
}
