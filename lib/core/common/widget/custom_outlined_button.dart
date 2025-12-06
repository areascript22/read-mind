import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatefulWidget {
  final void Function()? onTap;
  final Widget child;
  final Widget? icon;
  final Color? borderColor;
  final double borderRadius;
  final double borderWidth;
  final EdgeInsetsGeometry padding;

  const CustomOutlinedButton({
    super.key,
    required this.onTap,
    required this.child,
    this.icon,
    this.borderColor,
    this.borderRadius = 12.0,
    this.borderWidth = 1.5,
    this.padding = const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
  });

  @override
  State<CustomOutlinedButton> createState() => _CustomOutlinedButtonState();
}

class _CustomOutlinedButtonState extends State<CustomOutlinedButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final Color effectiveBorderColor =
        widget.onTap == null
            ? Colors.grey
            : (widget.borderColor ?? Theme.of(context).primaryColor);

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _isPressed ? 0.97 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: Container(
          constraints: const BoxConstraints(
            minWidth: double.infinity, // 👈 Ocupa todo el ancho disponible
          ),
          padding: widget.padding,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              color: effectiveBorderColor,
              width: widget.borderWidth,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          child: DefaultTextStyle(
            style: TextStyle(
              color: effectiveBorderColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            child:
                widget.icon == null
                    ? Center(
                      child: widget.child,
                    ) // 👈 Centrado simple sin icono
                    : Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // 👈 Centrado del contenido
                      mainAxisSize:
                          MainAxisSize.min, // 👈 Solo el espacio necesario
                      children: [
                        IconTheme(
                          data: IconThemeData(color: effectiveBorderColor),
                          child: widget.icon!,
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          // 👈 Texto flexible que se ajusta
                          child: widget.child,
                        ),
                      ],
                    ),
          ),
        ),
      ),
    );
  }
}
