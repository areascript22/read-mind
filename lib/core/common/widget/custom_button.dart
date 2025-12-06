import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;
  final Widget? icon;
  final Color? color;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  const CustomButton({
    super.key,
    required this.onTap,
    required this.child,
    this.icon,
    this.color,
    this.borderRadius = 12.0,
    this.padding = const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color:
              onTap == null
                  ? Colors.grey[400]
                  : (color ?? Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              blurRadius: 6,
            ),
          ],
        ),
        child: DefaultTextStyle(
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          child:
              icon == null
                  ? Center(child: child)
                  : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      icon!,
                      const SizedBox(width: 8),
                      Flexible(child: child),
                    ],
                  ),
        ),
      ),
    );
  }
}
