import 'package:client_app/shared/extentions/context/context_clipboard_ext.dart';
import 'package:flutter/material.dart';

class CopyButton extends StatelessWidget {
  final String textToCopy;
  final String? successMessage;
  final String? tooltip;
  final double iconSize;
  final IconData icon;

  const CopyButton({
    super.key,
    required this.textToCopy,
    this.successMessage,
    this.tooltip = 'Copiar al portapapeles',
    this.iconSize = 22,
    this.icon = Icons.content_copy,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, size: iconSize),
      tooltip: tooltip,
      onPressed:
          () => context.copyToClipboard(textToCopy, message: successMessage),
    );
  }
}
