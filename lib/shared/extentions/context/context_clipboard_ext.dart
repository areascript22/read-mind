import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/common/utils/toast_util.dart';

extension ClipboardExtension on BuildContext {
  Future<void> copyToClipboard(String text, {String? message}) async {
    if (text.isEmpty) return;

    try {
      await Clipboard.setData(ClipboardData(text: text));

      await HapticFeedback.lightImpact();
      if (!mounted) return;

      final toastMessage = message ?? "Copiado al portapapeles";

      ToastMessageUtil.showToast(toastMessage, this);
    } catch (e) {
      debugPrint("Error copying text to clipboard: $e");
    }
  }
}
